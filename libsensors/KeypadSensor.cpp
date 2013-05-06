/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <fcntl.h>
#include <errno.h>
#include <math.h>
#include <poll.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/select.h>

#include <cutils/log.h>
#include <cutils/properties.h>

#include "KeypadSensor.h"

/*****************************************************************************/

KeypadSensor::KeypadSensor()
    : SensorBase(NULL, "sholes-keypad"),
      mInputReader(4),
      mHasPendingEvent(false)
{
    mPendingEvent.version = sizeof(sensors_event_t);
    mPendingEvent.sensor = ID_K;
    mPendingEvent.type = SENSOR_TYPE_MAGNETIC_FIELD;
    memset(mPendingEvent.data, 0, sizeof(mPendingEvent.data));

    setInitialState();
}

KeypadSensor::~KeypadSensor() {
}

int KeypadSensor::setInitialState() {
    struct input_absinfo absinfo;
    if (!ioctl(data_fd, EVIOCGABS(SENSOR_TYPE_MAGNETIC_FIELD), &absinfo)) {
        mPendingEvent.light = absinfo.value;
        mHasPendingEvent = true;
    }
    return 0;
}

int KeypadSensor::enable(int32_t, int en) {
    if(en) {
        setInitialState();
    }
    return 0;
}

bool KeypadSensor::hasPendingEvents() const {
    return mHasPendingEvent;
}

int KeypadSensor::readEvents(sensors_event_t* data, int count)
{
    if (count < 1)
        return -EINVAL;

    if (mHasPendingEvent) {
        mHasPendingEvent = false;
        mPendingEvent.timestamp = getTimestamp();
        *data = mPendingEvent;
        return 1;
    }

    ssize_t n = mInputReader.fill(data_fd);
    if (n < 0)
        return n;

    int numEventReceived = 0;
    input_event const* event;

    while (count && mInputReader.readEvent(&event)) {
        int type = event->type;
        if (type == 5) { // Keypad sensor	     
            property_set("hw.keypad", (event->value==1)?"1":"0");
        } 
        /*LOGE("KeypadSensor: unknown event (type=%d, code=%d, value=%d)",
                    type, event->code, event->value);*/

        mInputReader.next();
    }
   

    return numEventReceived;
}