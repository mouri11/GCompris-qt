/* GCompris - Progress.qml
*
* Copyright (C) 2017 Rohit Das <rohit.das950@gmail.com>
*
*   This program is free software; you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation; either version 3 of the License, or
*   (at your option) any later version.
*
*   This program is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with this program; if not, see <http://www.gnu.org/licenses/>.
*/
import QtQuick 2.6

Rectangle {
    id: progress
    property int ratio: 0
    property ParallelAnimation anim: animation
    opacity: items.progressBarOpacity
    anchors.top: parent.top
    anchors.topMargin: parent.height / parent.implicitHeight * 100
    width: ratio / 100 * parent.width / parent.implicitWidth * 200
    height: parent.height / parent.implicitHeight * 20
    ParallelAnimation {
        id: animation
        onRunningChanged: {
            if (!animation.running) {
                timerBonus.start()
            }
        }
        PropertyAnimation {
            target: progress
            property: "ratio"
            from: 0
            to: 100
            duration: items.duration
        }
        PropertyAnimation {
            target: progress
            property: "color"
            from: "#00FF00"
            to: "#FF0000"
            duration: items.duration
        }
    }
}
