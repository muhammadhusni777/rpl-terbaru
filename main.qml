import QtQuick.Window 2.2 //2.1
import QtQuick.Controls 1.4 //1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles.Desktop 1.0
import QtQuick 2.12//2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtLocation 5.11
import QtPositioning 5.0
import QtQuick.Window 2.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Imagine 2.3
import QtQuick.Controls.Material 2.0
import QtQuick 2.7
//import QtWebEngine 1.0
import "controls"
import QtQuick.Shapes 1.14


Rectangle{
width: 1380
height: 800
color : "grey"

function updateValue() {
        //gheading.angle = mqttvalue.heading_G()
		gps_status.color = mqttvalue.gps_status_color()
		
        windSpeed_value.text = mqttvalue.windspeed()
        wind_direct_value.text = mqttvalue.winddirect()
        latitude_position_value.text = mqttvalue.lat()
        longitude_position_value.text = mqttvalue.long()
        heading_value.text = mqttvalue.headingship()
        markerdirect.angle = mqttvalue.headingship()
        vessel.rotation = mqttvalue.headingship()
		//vessel1.rotation = mqttvalue.headingship()

        lat_target.text = mqttvalue.lat_target()
        long_target.text = mqttvalue.long_target()

        speed1.text = mqttvalue.Set_Speed1()
        speed2.text = mqttvalue.Set_Speed2()
        speed3.text = mqttvalue.Set_Speed3()
        speed4.text = mqttvalue.Set_Speed4()

        //gov1.active = mqttvalue.engineconect1()
        //gov2.active = mqttvalue.engineconect2()
        //gov3.active = mqttvalue.engineconect3()
        //gov4.active = mqttvalue.engineconect4()

		rpm1.text = "FLOW1: " + mqttvalue.flow_lpm()
		rpm2.text = "FLOW2 : " + mqttvalue.flow_lpm2()
		rpm3.text = "RPM Engine 3 : " + mqttvalue.rpm3()
		rpm4.text = "RPM Engine 4 : " + mqttvalue.rpm4()
		
		
        arrowkiridepan.rotation = mqttvalue.steering4()
        arrowkanandepan.rotation = mqttvalue.steering1()
        arrowkananbelakang.rotation = mqttvalue.steering2()
        arrowkiribelakang.rotation = mqttvalue.steering3()
		
		arrowkiridepan_target.rotation = mqttvalue.steering4_target()
        arrowkanandepan_target.rotation = mqttvalue.steering1_target()
        arrowkananbelakang_target.rotation = mqttvalue.steering2_target()
        arrowkiribelakang_target.rotation = mqttvalue.steering3_target()
		
		
        mqttvalue.payout(distance.text)
		mqttvalue.water_depth(water_depth.text)
        latitude_graphnel.text = mqttvalue.graphnel_latitude()
        longitude_graphnel.text = mqttvalue.graphnel_longitude()
		
		line_length.text = "line length : " + mqttvalue.line_length() + " m"	
		mqttvalue.station_keeping(station_keeping_button.checked)
		mqttvalue.autopilot(autopilot_button.checked)
		
		position_error.text = "POSITION ERROR : "+ mqttvalue.position_error() + " m"		
		dir_error.text = "DIR ERROR : " + mqttvalue.dir_error() + " °"			
		
		mqttvalue.heading_target(slider.value)
		
		heading_error.text = "HEADING ERROR : " + mqttvalue.heading_error()
		
		
		if (control_manual.checked == true){
			mqttvalue.thrusterMode("manual")
		}
		
		if (control_auto.checked == true){
			mqttvalue.thrusterMode("auto")
		}
		
		if (heading_keeping_button.checked == true){
			mqttvalue.control_style("heading keeping")
			
			
			
		}
		
		if (sway_keeping_button.checked == true){
			mqttvalue.control_style("sway keeping")
			
			
		}
		
		if (station_keeping_button.checked == true){
			mqttvalue.control_style("station keeping")
			
			
		}
		
		if (autopilot_button.checked == true){
			mqttvalue.control_style("autopilot")
			
		}
		
			
		
		if (tracking_line.checked == true){
			mqttvalue.tracking("yes")
		}
		
		
		
		
		
		gov1.color = mqttvalue.spc_indicator_color()
		gov4.color = mqttvalue.spc_indicator_color()
		
		ship_speed.text = mqttvalue.speed_ship()
		
		//console.log(map.zoomLevel)
		
	}




Rectangle {
    id: layar
    width: 1200
    height: 600
    visible: true

    

    Rectangle{
        id:mokup
        color: "black"
        anchors.fill: parent
        anchors.rightMargin: 8
        anchors.bottomMargin: 0
        anchors.leftMargin: -8
        anchors.topMargin: 0
		
		
		
        Image {
            id: backgroud
            x: -44
            y: -14
            width: 1404
            height: 654
            anchors.fill: parent
            source: "GUI DP Ponton versi 2.png"
            anchors.rightMargin: -117
            anchors.leftMargin: 7
            scale: 1.1
            anchors.bottomMargin: -74
            anchors.topMargin: 21
			
			Image {
				x: 140
				y : 280
				width : 150
				height : 200
				source : "barge.png"
				
				
			}
			
			Rectangle{
			x: 300
			y : 300
			width : 50
			height : 70
			color : "transparent"
			border.width : 2
			border.color : "white"
			
			Text{
				anchors.horizontalCenter: parent.horizontalCenter
                y: -20
                color: "#ffffff"
                text: qsTr("Engine 1")
                font.pixelSize: 12
                font.styleName: "Bold"
                font.weight: Font.Bold
			}
			
            Text {
                id: speed1
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            StatusIndicator {
                id: gov1
                anchors.horizontalCenter: parent.horizontalCenter
                y: 30
                width: 24
                height: 31
                active: true
                color: "green"
            }
			
			}


			Rectangle{
			x: 300
			y : 410
			width : 50
			height : 70
			color : "transparent"
			border.width : 2
			border.color : "white"
			
			Text{
				anchors.horizontalCenter: parent.horizontalCenter
                y: -20
                color: "#ffffff"
                text: qsTr("Engine 2")
                font.pixelSize: 12
                font.styleName: "Bold"
                font.weight: Font.Bold
			}
			
            Text {
                id: speed2
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            StatusIndicator {
                id: gov2
                anchors.horizontalCenter: parent.horizontalCenter
                y: 30
                width: 24
                height: 31
                active: false
                color: "green"
            }

			
			}
			
			Rectangle{
			x: 80
			y : 410
			width : 50
			height : 70
			color : "transparent"
			border.width : 2
			border.color : "white"
			
			Text{
				anchors.horizontalCenter: parent.horizontalCenter
                y: -20
                color: "#ffffff"
                text: qsTr("Engine 3")
                font.pixelSize: 12
                font.styleName: "Bold"
                font.weight: Font.Bold
			}
			
            Text {
                id: speed3
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            StatusIndicator {
                id: gov3
                anchors.horizontalCenter: parent.horizontalCenter
                y: 30
                width: 24
                height: 31
                active: false
                color: "green"
            
			}
			}


			Rectangle{
				x: 80
				y : 300
				width : 50
				height : 70
				color : "transparent"
				border.width : 2
				border.color : "white"
				
				Text{
				anchors.horizontalCenter: parent.horizontalCenter
                y: -20
                color: "#ffffff"
                text: qsTr("Engine 4")
                font.pixelSize: 12
                font.styleName: "Bold"
                font.weight: Font.Bold
			}
				
				Text {
					id: speed4
					anchors.horizontalCenter: parent.horizontalCenter
					y: 10
					color: "#ffffff"
					text: qsTr("100")
					font.pixelSize: 16
					font.styleName: "Bold"
					font.weight: Font.Bold
				}

				StatusIndicator {
					id: gov4
					anchors.horizontalCenter: parent.horizontalCenter
					y: 30
					width: 24
					height: 31
					active: true
					color: "green"
				}
			
			}
			
			Rectangle{
			x: 0
			y : 490
			width : 375
			height : 3
			color : "white"
			
			Text {
					x: 70
					y: 15
					color: "#ffffff"
					text: qsTr("Steering 4 : ")
					font.pixelSize: 12
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
				
			Text {
					id : arrowkiridepan_val
					x: 65
					y: 35
					color: "#ffffff"
					text: arrowkiridepan.rotation + "/" +  arrowkiridepan_target.rotation
					font.pixelSize: 18
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
			
			Image {
                x : 130
				y : 0
				width : 90
				height : 80
				id: arrowkiridepan_target
                source: "needlewhite.png"
                transformOrigin: Item.Center
				visible : heading_keeping_button.checked ||
						  station_keeping_button.checked ||
						  sway_keeping_button.checked ||
						  autopilot_button.checked
                rotation: 20
                scale: 1
            }
			
			
			
			
			
			
			Image {
                x : 130
				y : 0
				width : 90
				height : 80
				id: arrowkiridepan
                source: "needle.png"
                transformOrigin: Item.Center
                rotation: 0
                scale: 1
            }
			
			
			
			
			
			
			Rectangle{
				x : 150
				y : 15
				width : 50
				height : 50
				color : "transparent"
				border.color : "white"
				border.width : 2
				radius : width/2
			}
			
			Text {
					x: 70
					y: 80
					color: "#ffffff"
					text: qsTr("Steering 3 : ")
					font.pixelSize: 12
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
			Text {
					id : arrowkiribelakang_val
					x: 65
					y: 100
					color: "#ffffff"
					text: arrowkiribelakang.rotation + "/" +  arrowkiribelakang_target.rotation
					font.pixelSize: 18
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
			Image {
				x : 130
				y : 65
				width : 90
				height : 80
                id: arrowkiribelakang_target
				visible : heading_keeping_button.checked ||
						  station_keeping_button.checked ||
						  sway_keeping_button.checked ||
						  autopilot_button.checked
                source: "needlewhite.png"
                rotation: 155
                scale: 1
            }
			
			
			
			
			
			Image {
				x : 130
				y : 65
				width : 90
				height : 80
                id: arrowkiribelakang
                source: "needle.png"
                rotation: 0
                scale: 1
            }
			
			Rectangle{
				x : 150
				y : 80
				width : 50
				height : 50
				color : "transparent"
				border.color : "white"
				border.width : 2
				radius : width/2
			}
			
			Text {
					x: 280
					y: 80
					color: "#ffffff"
					text: qsTr("Steering 2 : ")
					font.pixelSize: 12
					font.styleName: "Bold"
					font.weight: Font.Bold
				}

			Text {
					id : arrowkananbelakang_val
					x: 290
					y: 100
					color: "#ffffff"
					text: arrowkananbelakang.rotation + "/" +  arrowkananbelakang_target.rotation
					font.pixelSize: 18
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
			 Image {
				x : 200
				y : 65
				width : 90
				height : 80
                id: arrowkananbelakang_target
				visible : heading_keeping_button.checked ||
						  station_keeping_button.checked ||
						  sway_keeping_button.checked ||
						  autopilot_button.checked
                source: "needlewhite.png"
                rotation: 50
                scale: 1
            }


			
            Image {
				x : 200
				y : 65
				width : 90
				height : 80
                id: arrowkananbelakang
                source: "needle.png"
                rotation: 0
                scale: 1
            }
			
			Rectangle{
				x : 220
				y : 80
				width : 50
				height : 50
				color : "transparent"
				border.color : "white"
				border.width : 2
				radius : width/2
			}

			
			Text {
					x: 280
					y: 15
					color: "#ffffff"
					text: qsTr("Steering 1 : ")
					font.pixelSize: 12
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
			Text {
					id : arrowkanandepan_val
					x: 290
					y: 35
					color: "#ffffff"
					text: arrowkanandepan.rotation + "/" + arrowkanandepan_target.rotation
					font.pixelSize: 18
					font.styleName: "Bold"
					font.weight: Font.Bold
				}
			
            Image {
				x : 200
				y : 0
				width : 90
				height : 80
                id: arrowkanandepan_target
                source: "needlewhite.png"
				visible : heading_keeping_button.checked ||
						  station_keeping_button.checked ||
						  sway_keeping_button.checked ||
						  autopilot_button.checked
                rotation: 0
                scale: 1

            }
			
			
			Image {
				x : 200
				y : 0
				width : 90
				height : 80
                id: arrowkanandepan
                source: "needle.png"
                rotation: 0
                scale: 1

            }
			
			Rectangle{
				x : 220
				y : 15
				width : 50
				height : 50
				color : "transparent"
				border.color : "white"
				border.width : 2
				radius : width/2
			}

			Text{
				id : rpm1
				x : 380
				y : 95
				width : 50
				height : 50
				text : "FLOW : "
				color : "white"
				font.pixelSize : 18
				
			}
			
			Text{
				id : rpm4
				x : 380
				y : 120
				width : 50
				height : 50
				text : "RPM engine 4 : "
				color : "white"
				visible : false
				
			}
			
			
			Text{
				id : rpm2
				x : 530
				y : 95
				width : 50
				height : 50
				text : "FLOW 2 : "
				color : "white"
				visible : true
				font.pixelSize : 18
				
			}
			
			Text{
				id : rpm3
				x : 530
				y : 120
				width : 50
				height : 50
				text : "RPM engine 3 : "
				color : "white"
				visible : false
			}
			
			

			
			}
			

            Text {
                id: latitude_position_value
                x: 600
                y: 17
                width: 95
                height: 19
                color: "white"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: longitude_position_value
                x: 600
                y: 42
                width: 95
                height: 19
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: windSpeed_value
                x: 136
                y: 17
                width: 33
                height: 19
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: wind_direct_value
                x: 138
                y: 42
                width: 32
                height: 19
                color: "#ffffff"
                text: qsTr("100")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: wind_direct_value1
                x: 168
                y: 39
                width: 32
                height: 19
                color: "#ffffff"
                text: qsTr("o")
                font.pixelSize: 11
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: windSpeed_value1
                x: 167
                y: 17
                width: 33
                height: 19
                color: "#ffffff"
                text: qsTr("kt")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }

            Text {
                id: heading_value
                x: 277
                y: 11
                width: 65
                height: 60
                color: "#ffffff"
                text: qsTr("360")
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Bold"
                font.weight: Font.Bold
            }


			Button{
				id : control_manual
				x: 750
				y : 20
				width : 100
				height : 40
				text : "joystick"
				checkable : true
				checked : true
				onClicked:{
					if(control_manual.checked == true){
					control_auto.checked = false
					}
					
					if(control_manual.checked == false){
					control_auto.checked = true
					}
					
				}
				
			}
			
			
			Button{
				id : control_auto
				x: 870
				y : 20
				width : 100
				height : 40
				text : "automatic"
				checkable : true
				
				onClicked:{
					if(control_auto.checked == true){
					control_manual.checked = false
					}
					
					if(control_auto.checked == false){
					control_manual.checked = true
					}
					
				}
				
			}
			
			
			Image{
			x : 1000
			y : 20
			width : 40
			height : 35
			source : "satellite.png"
			
			Text{
				anchors.horizontalCenter: parent.horizontalCenter
				y : 34
				text : "GPS Satellite"
				font.pixelSize : 10
				color : "white"
				
			}
			}
			
			
			StatusIndicator{
				id : gps_status
				x : 1050
				y : 25
				height : 30
				width : 30
				color : "red"
				active : true
			}
            
			
			Text {
                id: ship_speed
                x: 450
                y: 22
                width: 32
                height: 19
                color: "#ffffff"
                text: qsTr("0 Kt")
                font.pixelSize: 22
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
			
			 CircularSlider {
				id: slider
				x: 150
				y: 100
				handleVerticalOffset: -30
				trackWidth: 2
				trackColor: "transparent"
				width: 140
				height: 140
				minValue: 0
				maxValue: 360
				value: 0
				snap: true
				stepSize: 1
				hideProgress: true
				hideTrack: true
				interactive: true
				
				visible : heading_keeping_button.checked || station_keeping_button.checked

				/// Custom Handle
				handle: Item {
					id: item
				
					width: 10
					height: 10

					Rectangle{
					width : parent.width
					height : parent.height
					radius : width/2
					color : "#50FA7B"
					}	

					transform: Translate {
						x: (slider.handleWidth - width) / 2
						y: (slider.handleHeight - height) / 2
					}
				}


				Repeater {
					model: 0
					visible : false

					delegate: Rectangle {
						anchors.centerIn: parent
						height: slider.height
						width: 1
						color: "#191919"
						transform: Rotation {
							origin.x: 1
							origin.y: slider.height / 2
							angle: 30 * index
						}
					}
				}

				/// Inner Trinagle
				Shape {
					id: triangle
					width: 30
					height: parent.height / 2 - 0
					x: (parent.width - width) / 2
					y: 0
					transform: Rotation {
						origin.x: triangle.width / 2
						origin.y: triangle.height
						angle: slider.angle
					}

					ShapePath {
						strokeWidth: 1
						strokeColor: "#50FA7B"
						fillColor: "#50FA7B"
						startX: triangle.width / 2
						startY: 0

						PathLine { x: 0; y: triangle.height }
						PathLine { x: triangle.width; y: triangle.height }
						PathLine { x: triangle.width/2; y: 0 }
					}
				}

				/// Inner Circle
				Rectangle {
					color: "#232323"
					width: 40
					height: width
					radius: width / 2
					anchors.centerIn: parent
					
					Label {
						anchors.centerIn: parent
						visible : false
						font.pointSize: 12
						color: "#FEFEFE"
						text: slider.value === 0 ? Number(12) : Number(slider.value).toString().padStart(2, '0')
					}
				}

				/// Outer Dial
				Rectangle {
					anchors.fill: parent
					color: "transparent"
					border.color: "#fefefe"
					border.width: 6
					visible : false
					radius: width / 2

				}

            
               
        }


            
           


		
            
            Item {
                id: graphnel
                x: 673
                y: 584
                width: 499

                height: 46
                visible: graphnelgroup.checked
                Text {
                    id: text17
                    x: 10
                    y: 2
                    color: "#ffffff"
                    text: qsTr("Latitude Graphnel     :")
                    font.pixelSize: 12
                }

                Text {
                    id: text18
                    x: 272
                    y: 3
                    color: "#ffffff"
                    text: qsTr("Payout :")
                    font.pixelSize: 10
                }

                TextField {
                    id: distance
                    x: 324
                    y: 0
                    width: 80
                    height: 21
                    color: "brown"
                    text: qsTr("")
                    font.pixelSize: 9
					//
                }
				
				Text {
                    id: text19
                    x: 272
                    y: 23
                    color: "#ffffff"
                    text: qsTr("Depth  :")
                    font.pixelSize: 10
                }
				
				 TextField {
                    id: water_depth
                    x: 324
                    y: 23
                    width: 80
                    height: 21
                    color: "brown"
                    text: qsTr("")
                    font.pixelSize: 9
                }
				
				
				

                Text {
                    id: text20
                    x: 8
                    y: 23
                    color: "#ffffff"
                    text: qsTr("Longitude Graphnel  :")
                    font.pixelSize: 12
                }

                Text {
                    id: latitude_graphnel
                    x: 131
                    y: 3
                    color: "#ffffff"
                    text: qsTr("Latitude Graphnel")
                    font.pixelSize: 12
                }

                Text {
                    id: longitude_graphnel
                    x: 131
                    y: 24
                    color: "#ffffff"
                    text: qsTr("Longitude Graphnel")
                    font.pixelSize: 12
                }

                CheckDelegate {
                    id: jangkar
                    x: 505
                    y: 3
                    width: 46
                    height: 41
                    text: qsTr("Active")
                    display: AbstractButton.IconOnly
                    highlighted: false
                    tristate: false
                    checkState: Qt.Unchecked
                    checkable: true
                    checked: false

                }
            }
			
			
			
			Item {
                id: thruster_properties
                x: 671
                y: 585
                width: 499
                height: 46
                visible: modethruster.checked
				
				Text {
                    id: mode_title
                    x: 5
                    y: 5
                    color: "#ffffff"
                    text: qsTr("mode  :")
                    font.pixelSize: 10
					
                }
				Button {
					id: bt00
					x :0
					y :20
					width: 70
					height: 20
					text: "openloop"
					onClicked:{

						if(bt00.text == "openloop"){
							//Tablero.setLed(13,'H')
							text = "closeloop";
							//rect1.visible = false
							mqttvalue.thrusterMode("closeloop")
							del1.visible = true
							orifice1_target.visible = true
							del2.visible = true
							orifice2_target.visible = true
							del3.visible = true
							orifice3_target.visible = true
							del4.visible = true
							orifice4_target.visible = true
							
				
						}else
						if(bt00.text == "closeloop"){
							//Tablero.setLed(13,'L')
							text = "openloop";
							//rect1.visible = true
							mqttvalue.thrusterMode("openloop")
							del1.visible = false
							orifice1_target.visible = false
							del2.visible = false
							orifice2_target.visible = false
							del3.visible = false
							del3.visible = false
							orifice3_target.visible = false
							del4.visible = false
							orifice4_target.visible = false
							
							
						}
					}
				}
				
				
				
				
				Text {
                    id: orifice1
                    x: 80
                    y: 2
                    color: "#ffffff"
                    text: qsTr("orifice1  :")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: orifice1_val
                    x: 150
                    y: 2
                    color: "#ffffff"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: del1
                    x: 180
                    y: 2
					visible : false
                    color: "black"
                    text: qsTr("/")
                    font.pixelSize: 12
					
                }
				Text {
                    id: orifice1_target
                    x: 190
                    y: 2
					visible : false
                    color: "black"
                    //text: qsTr("100")
                    font.pixelSize: 12
					
                }
				
				
				Text {
                    id: orifice2
                    x: 80
                    y: 20
                    color: "#ffffff"
                    text: qsTr("orifice2  :")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: orifice2_val
                    x: 150
                    y: 20
                    color: "#ffffff"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: del2
                    x: 180
                    y: 20
					visible : false
                    color: "black"
                    text: qsTr("/")
                    font.pixelSize: 12
					
                }
				Text {
                    id: orifice2_target
                    x: 190
                    y: 20
					visible : false
                    color: "black"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				
				Text {
                    id: orifice3
                    x: 220
                    y: 2
                    color: "#ffffff"
                    text: qsTr("orifice3  :")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: orifice3_val
                    x: 276
                    y: 2
                    color: "#ffffff"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: del3
                    x: 310
                    y: 2
					visible : false
                    color: "black"
                    text: qsTr("/")
                    font.pixelSize: 12
					
                }
				Text {
                    id: orifice3_target
                    x: 320
                    y: 2
					visible : false
                    color: "black"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				
				Text {
                    id: orifice4
                    x: 220
                    y: 20
                    color: "#ffffff"
                    text: qsTr("orifice4  :")
                    font.pixelSize: 12
					
                }
				
				Text {
                    id: orifice4_val
                    x: 276
                    y: 20
                    color: "#ffffff"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				Text {
                    id: del4
                    x: 310
                    y: 20
					visible : false
                    color: "black"
                    text: qsTr("/")
                    font.pixelSize: 12
					
                }
				Text {
                    id: orifice4_target
                    x: 320
                    y: 20
					visible : false
                    color: "black"
                    text: qsTr("000")
                    font.pixelSize: 12
					
                }
				
				
				
				
				
				
                
				
                

                
            }
			
			Item {
                id: aggresivity_properties
                x: 671
                y: 585
                width: 499
                height: 46
                visible: aggresivity.checked
				
				Text {
                    id: aggresivity_text
                    x: 0
                    y: 0
                    color: "#ffffff"
                    text: qsTr("AGGRESIVITY : ")
                    font.pixelSize: 12
                }
				
				
				
				Slider {
					id: slider2
					x:0
					y: 20
					from:0
					to : 2
					stepSize: 0.1
					height: 20
					width: 300
					value: 1
		
				}
				
				Text {
                    id: aggresivity_value
                    x: 100
                    y: 0
                    color: "#ffffff"
                    text: slider2.value.toFixed(2)
                    font.pixelSize: 12
                }
				
				Button {
					id: btspeedset
					x :350
					y :20
					width: 45
					height: 20
					
					text: "set"
					onClicked:{
						mqttvalue.setMinVal(textInputthruster2.text)
						mqttvalue.setMaxVal(textInputthruster3.text)
						
					}
				}
				
				Text {
                    id: textminthruster1
                    x: 400
                    y: 2
                    color: "#ffffff"
                    text: qsTr("min val  :")
                    font.pixelSize: 12
					
                }

                Text {
                    id: textmaxthruster2
                    x: 400
                    y: 20
                    color: "#ffffff"
                    text: qsTr("max val  :")
                    font.pixelSize: 12
                }

                TextInput  {
                    id: textInputthruster2
                    x: 470
                    y: 3
                    width: 80
                    height: 20
                    color: "#ffffff"
                    text: qsTr("0000")
                    font.pixelSize: 10
					
                }
				
				
                TextInput {
                    id: textInputthruster3
                    x: 470
                    y: 20
                    width: 80
                    height: 20
                    color: "#ffffff"
                    text: qsTr("1000")
                    font.pixelSize: 10
                }
				
				
			}
			
			
        }


        ListModel{
            id: md
        }
        ListModel{
            id: md1
        }

        ListModel{
            id: md2
        }



        Plugin {
		   id: mapPlugin
		   name: "osm"

		   //provide the address of the tile server to the plugin
		   PluginParameter {
			  name: "osm.mapping.custom.host"
			  value: "http://localhost/osm/"
		   }

		   /*disable retrieval of the providers information from the remote repository. 
		   If this parameter is not set to true (as shown here), then while offline, 
		   network errors will be generated at run time*/
		   PluginParameter {
			  name: "osm.mapping.providersrepository.disabled"
			  value: true
		   }
		}



        Item {
            id: mapGroup
            x: 360
            y: 63
            width: 948
            height: 563
            property int count : 0
            property real lati : -6.000507
            property real longi : 106.687493



			Map{
                id: map
                x: 0
                y: 0
                width: parent.width
                height: parent.height
                color: "#f9f9f9"
                anchors.rightMargin: 8
                anchors.centerIn: parent;
                anchors.fill: parent
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                zoomLevel : 11
				minimumZoomLevel: 10.05
				maximumZoomLevel: 1000.4
                copyrightsVisible: true
                antialiasing: true
                maximumTilt: 89.3
                plugin: mapPlugin
                activeMapType: supportedMapTypes[0]

                //center: QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text)
                center: QtPositioning.coordinate(1.0204327129524284 , 103.92695632739532)

				gesture.enabled: true
                gesture.acceptedGestures: MapGestureArea.PinchGesture | MapGestureArea.PanGesture



                visible: true
				
								
				///TALI KEVLAR
				MapPolyline {
    
					line.width: 4
					line.color: 'black'      
					visible: true//jangkar.checked

				path:


				[
					{latitude : latitude_position_value.text, longitude : longitude_position_value.text },
					{latitude : latitude_graphnel.text, longitude : longitude_graphnel.text},
					
				]
		
			}
			
			
			MapPolyline {
					//STATION KEEPING LINE
					line.width: 4
					line.color: 'orange'      
					visible: true//jangkar.checked

				path:


				[
					{latitude : latitude_position_value.text, longitude : longitude_position_value.text },
					{latitude : lat_target.text, longitude : long_target.text},
					
				]
		
			}
			
			Text{
				id : lat_target
				text : "5"//mqttvalue.lat_target()
				visible : false
				
			}
			
			Text{
				id : long_target
				text : "3"//mqttvalue.long_target()
				visible : false
				
			}
			
			

                Line{
                    id: li
                }
                Line1{
                    id: li1
                }

                Line2{
                    id: li2
                }


                Line3{
                    id:rpl_ondong_tahuna

                }

                Line4{
                    id:rpl_ondong_manado
                }

                Line5{
                    id:sanana_taliabu
                }
				
				
               Line6{
                    id:route
                }
				
				
                Line7{
                    id:circleondong_tahuna
                }


                Line8{
                    id:actaliabu_sanana
                }

				
				// selayar lingga
				MapCircle { 
                    center {
                        latitude: -0.286233332999927
                        longitude: 104.482733333 //#1
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }
				
				
				MapCircle { 
                    center {
                        latitude: -0.285329787999956
                        longitude: 104.49097057 //#2
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }
				
				
				MapCircle { 
                    center {
                        latitude: -0.286317332999943
                        longitude: 104.502558028 //#3
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }
				
				MapCircle { 
                    center {
                        latitude:-0.28126231799996
                        longitude: 104.512625181 //#4
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }
				
				
				MapCircle { 
                    center {
                        latitude:-0.276440679999951
                        longitude: 104.514920141 //#5
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }
				
				MapCircle { 
                    center {
                        latitude:-0.273599999999931
                        longitude: 104.51545 //#6
                    }
                    radius: 50
                    color: '#46a2da'
                    border.color: "#190a33"
                    border.width: 3
                }

				// dabo selayar
				
				MapCircle {
					center {
						latitude: -0.276440679999951
						longitude: 104.514920141 //#5
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.341294
						longitude: 104.462844
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.340964
						longitude: 104.462765
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.339872
						longitude: 104.462503
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.338025
						longitude: 104.462061
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.335381
						longitude: 104.461428
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.33275
						longitude: 104.460797
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.330567
						longitude: 104.460275
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.328868
						longitude: 104.459868
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}

				MapCircle {
					center {
						latitude: -0.328686
						longitude: 104.459825
					}
					radius: 50
					color: '#46a2da'
					border {
						color: "#190a33"
						width: 3
					}
				}


				//batam buluh
				MapCircle {
					center {
						latitude: 1.02601
						longitude: 103.92565
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}
				MapCircle {
					center {
						latitude: 1.02573
						longitude: 103.92547
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}
				MapCircle {
					center {
						latitude: 1.02182
						longitude: 103.92303 
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}
				MapCircle {
					center {
						latitude: 1.01952
						longitude: 103.92350
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}
				MapCircle {
					center {
						latitude: 1.01757
						longitude: 103.92500
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}
				
				MapCircle {
					center {
						latitude: 1.01833
						longitude: 103.92597
					}
					radius: 50
					color: "#46a2da"
					border {
						color: "#190a33"
						width: 3
					}
				}


				


                Timer {
					

                    function updateloc() {
					
                     
					
					if (li1.pathLength() < 500){
                                var text = md1.count + 1;

                                md1.append({"coords": QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text),
                                               "title": text})
											   
					}

					
                       if (tracking_line.checked == true){
							var text = md1.count + 1;

                            md1.append({"coords": QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text),
                                           "title": text})
                            li1.addCoordinate(QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text))
                        }

                        //if (li1.pathLength() >= 50){
						if (tracking_line.checked == false){
                            for (var index = li1.pathLength(); index >= 0; index--)
                            {
                                li1.removeCoordinate([index]);
                            }
												
							
                        }
						
					
					
                    
					
					}
                    interval: 1000; running: true; repeat: true
                    onTriggered: {
                        updateloc()
                    }
                }





                Timer {


                    function updateloc2() {
						
					
					}
					
                    interval: 2000; running: true; repeat: true
                    onTriggered: {
                        updateloc2()
                    }
                }





				MapItemView{
            model: md
            delegate: Marker{
                text: title
                coordinate: QtPositioning.coordinate(coords.latitude, coords.longitude)
            }
        }
        Line{
            id: lili
        }

				
                //menampilkan koordinat sesuai mouse
                MouseArea {
                    hoverEnabled: true
                    property var coordinate: map.toCoordinate(Qt.point(mouseX, mouseY))
                    x: 0
                    y: 0
                    width: parent.width//780
                    height: parent.height//331
                    //anchors.rightMargin: -30
                    //anchors.leftMargin: 19
                    //anchors.fill: parent
					//acceptedButtons: Qt.RightButton//Qt.LeftButton | Qt.RightButton
                    
					Label
                    {
                        x: parent.mouseX - width
                        y: parent.mouseY - height - 5
                        //text: "lat: %4; lon:%10".arg(parent.coordinate.latitude).arg(parent.coordinate.longitude)
                        text: "Lat : " + (parent.coordinate.latitude).toFixed(6) + " Long :" + (parent.coordinate.longitude).toFixed(6)
                        
						color:"navy"

                    }
					
					
					Text{
						id : lat_mouse
						x: parent.mouseX - width
                        y: parent.mouseY - height - 5
						text: (parent.coordinate.latitude).toFixed(6)
						color : "red"
						visible : false
						
					}
					
					Text{
						id : long_mouse
						x: parent.mouseX - width
                        y: parent.mouseY - height - 5
						text: (parent.coordinate.longitude).toFixed(6)
						color : "red"
						visible : false
						
					}
					
                    property var panjanglintasan: li.pathLength()
                    property var path: li.path
					
					
					
                    onDoubleClicked: {
                        //mqttvalue.get_dot(lat_mouse.text, long_mouse.text)
						
						if (autopilot_button.checked == true){
						
						//console.log("dot selected")
						var point = Qt.point(mouse.x, mouse.y)
						var coord = map.toCoordinate(point);
						var coordinate = map.toCoordinate(Qt.point(mouse.x, mouse.y))
						//backend.lat((coordinate.latitude).toFixed(6))
						//backend.long((coordinate.longitude).toFixed(6))
						var text = md.count + 1;
				
						md.append({"coords": coord, "title": text})
						
						li.addCoordinate(coord)
						
						
						}
                    }
					
				Button{
				x: 200
				y : 0
				text: "clear line target"
				visible : autopilot_button.checked
				onClicked:{
					md.remove(md.count - 1);
					var index = li.pathLength() 
					li.removeCoordinate([index] - 1);
					//backend.remove("remove")
					
					
				
				}
				
			}
					
					 onPressAndHold: {
							
							var crd = map.toCoordinate(Qt.point(mouseX, mouseY))
							
							if (md.count < 1){
                                mqttvalue.get_lat(crd.latitude)
                                mqttvalue.get_lon(crd.longitude)
                            }
                            else if (md.count > 0){
                                mqttvalue.get_lat1(crd.latitude)
                                mqttvalue.get_lon1(crd.longitude)
                            }
                            
                            markerModel.append({ "latitude":lat_mouse.text, "longitude": long_mouse.text})
                            var text = md.count + 1;
                            md.append({"coords": coordinate, "title": text})
                            li.addCoordinate(coordinate)

							
                        }



                }




                //Kapal

                MapQuickItem{
                    id : marker
                    sourceItem : Image{
                        id: imagenavigasi
                        width: 33
                        height: 37
                        //transformOrigin: Item.Center
                        source:"navigasi.png"
						//source:"segitiga.png"
                        //rotation: 0
                        fillMode: Image.PreserveAspectFit
                        transform: [
                            Rotation {
                                id: markerdirect
                                origin.x: 15
                                origin.y: 14
                                angle: 0
                            }]
                    }
                    coordinate: QtPositioning.coordinate(latitude_position_value.text, longitude_position_value.text)
                    //coordinate: QtPositioning.coordinate(2.73706666666667, 125.36065)
                    anchorPoint.x : 15
                    anchorPoint.y : 14
                    //anchorPoint.x : parent
                    //anchorPoint.y : parent

                }



                MapQuickItem{
                    id : marker1
					
                    sourceItem : 
					
					Rectangle {
					
					x:0
					y:0
					width: 60
                    height: 80
					color : "transparent"
					
					
					
					/*
					Image{
                        id: imagenavigasi1
                        x:-10
						y:-0
						width: parent.height
                        height: parent.width
                        transformOrigin: Item.Center
                        source:"up_new.png"
                        rotation: 270
                        fillMode: Image.PreserveAspectFit
                        
						
                    }
					*/
					
					}
					
                    visible: true//jangkar.checked
                    coordinate: QtPositioning.coordinate(latitude_graphnel.text, longitude_graphnel.text)
                    anchorPoint.x : imagenavigasi1.height/2
                    anchorPoint.y : imagenavigasi1.width/2
                    

                }


                MapPolyline{
                    id:crossing
                    line.width: 6
                    line.color: 'red'
                    path:[
                        {latitude: textInput.text, longitude:  textInput1.text },
                        {latitude: textInput2.text, longitude:  textInput3.text },



                    ]
                }


				MapPolyline{
                    id:crossing2
                    line.width: 6
                    line.color: 'red'
                    path:[
                        {latitude: textInput6.text, longitude:  textInput7.text },
                        {latitude: textInput4.text, longitude:  textInput5.text },



                    ]
                }


                Rectangle {
                    id: rectangle
                    x: 840
                    y: 508
                    width: 92
                    height: 47
                    color: "#a18cd1"
                    radius: 10
					visible : false
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#84fab0"
                        }

                        GradientStop {
                            position: 1
                            color: "#8fd3f4"
                        }
                    }

                    MouseArea{
                        x: 0
                        y: 0
                        width: 92
                        height: 47
                        onDoubleClicked: {
                            markerModel.clear()
                            mqttvalue.get_lat(0)
                            mqttvalue.get_lon(0)
                            mqttvalue.get_lat1(0)
                            mqttvalue.get_lon1(0)
                            md.clear()
                            //md.count = 0
                            for (var index = li.pathLength(); index >= 0; index--)
                            {
                                
                                li.removeCoordinate([index]);
                                li1.removeCoordinate([index]);
                                
                            }
                        }
                    }

                    
					
					
					

                }








                MapQuickItem{
                    id : bouy

                    sourceItem : Image{
                        id: bouyondong
                        width: 40
                        height: 37
                        //transformOrigin: Item.Center
                        source:"bouy.png"
                        //rotation: 0
                        fillMode: Image.PreserveAspectFit

                    }



                    coordinate: QtPositioning.coordinate(3.572855377, 125.350032879)
                    //coordinate: QtPositioning.coordinate(2.73706666666667, 125.36065)
                    anchorPoint.x : 15
                    anchorPoint.y : 14

                }



                MapItemView {
                    id: mivMarker
                    model: ListModel {
                        id: markerModel
                    }
                    delegate: Component {
                        MapQuickItem {
                            coordinate: QtPositioning.coordinate(latitude, longitude)
                            property real slideIn: 0
                        }
                    } 
                }

			Button {
			id : track_line
            x: 800
            y: 0
            text : "line track"
			width : 150
            checkable: true
            checked: false
			
			}
			
			
			
			
			Button {
			id : heading_keeping_button
            x: 800
            y: 300
            text : "Heading Keeping"
			width : 150
            checkable: true
            checked: false
			
			onClicked:{
				sway_keeping_button.checked = false
				station_keeping_button.checked = false
				autopilot_button.checked = false
			}
			
			}
			
			Button {
			id : sway_keeping_button
            x: 800
            y: 350
            text : "Sway Keeping"
			width : 150
            checkable: true
            checked: false
			
			onClicked:{
				heading_keeping_button.checked = false
				station_keeping_button.checked = false
				autopilot_button.checked = false
			}
			
			}
			
			
			Button {
			id : station_keeping_button
            x: 800
            y: 400
			width : 150
            text : "Station Keeping"
			
            checkable: true
            checked: false
			
			
			onClicked:{
				sway_keeping_button.checked = false
				heading_keeping_button.checked = false
				autopilot_button.checked = false
			}
			
		   }
		   
		   
		   Rectangle{
		   x : 700
		   y : 80
		   width : 250
		   height : 150
		   color : "grey"
		   border.color : "black"
		   border.width : 2
		   visible : station_keeping_button.checked
		   
		    Text {
				
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
                color: "#ffffff"
                text: qsTr("STATION KEEPING")
                font.pixelSize: 20
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
			
			Text {
				id : position_error
                x : 10
                y: 50
                color: "#ffffff"
                text: qsTr("POSITION ERROR : ")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
			
			Text {
				id : dir_error
                x : 10
                y: 90
                color: "#ffffff"
                text: qsTr("DIR ERROR : ")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
		   
			
		   
		   }
		   
		   
		   Rectangle{
		   id : psi_reference
		   x : 0
		   y : 230
		   width : 250
		   height : 150
		   color : "grey"
		   border.color : "black"
		   border.width : 2
		   visible : heading_keeping_button.checked || station_keeping_button.checked
		   
		   Text {
				
                anchors.horizontalCenter: parent.horizontalCenter
                y: 10
                color: "#ffffff"
                text: qsTr("HEADING KEEPING")
                font.pixelSize: 20
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
			
			
			 Text {
				
                x: 10
                y: 50
                color: "#ffffff"
                text: qsTr("HEADING TARGET : ") + slider.value
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
			
			Text {
				id : heading_error
                x: 10
                y: 80
                color: "#ffffff"
                text: qsTr("HEADING ERROR :")
                font.pixelSize: 16
                font.styleName: "Bold"
                font.weight: Font.Bold
            }
		   
		   
		   
		   }
			
			Button {
			id : autopilot_button
            x: 800
            y: 450
            text : "autopilot mode"
			width : 150
            checkable: true
            checked: false
			onClicked:{
				sway_keeping_button.checked = false
				heading_keeping_button.checked = false
				station_keeping_button.checked = false
			}
			
			}
			
			

		
    
	
		Button {
            id: clear_ship_track
            x: 800
            y: 500
            text : "clear line"
			width : 150
			height  :40
            checkable: true
            checked: false
           
		   onClicked:{
			   markerModel.clear()
			   md.clear()
			   mqttvalue.line_reset(0)
			   
			   for (var index = li.pathLength(); index >= 0; index--){
                    li.removeCoordinate([index]);
                    li1.removeCoordinate([index]);
                                    
                    }
			   
			   
		   }
		}
		
		
		 Button {
            id:tracking_line
            x: 800
            y: 70
            width : 150
			height  :40
            checkable: true
            checked: false
			text : "tracking line"
        }
		
		
		Text {
			id : line_length
			x : 10
			y : 10
			text : "Line Length : 0 m"
			font.pixelSize : 15
			color : "blue"
			font.family: "Helvetica"
			font.bold : true
		}
		
		
            }
			
			
			
			
			
			
           
			
			
        }


        Image {
            id: vessel
            x: 111
            y: 125
            width: 144
            height: 93
            source: "CHH.png"
            rotation: 0
            fillMode: Image.PreserveAspectFit
        }

	
       

        Button {
            id: navionic
            x: 1264
            y: 110
            width: 34
            height: 31
            checkable: true
            checked: false
			visible : false
            Image {
                id: wkwk1
                anchors.fill: parent
                source: "navionic.png"
            }
        }
    }



	




    TabButton {
        id: line1
        x: 675
        y: 606
        width: 61
        height: 16
        text: qsTr("Line 1")
        checkable: true
        checked: false
		visible : false
    }

    TabButton {
        id: line2
        x: 742
        y: 606
        width: 61
        height: 16
        text: qsTr("Line 2")
        checkable: true
        checked: false
		visible : false
    }

    TabButton {
        id: line3
        x: 809
        y: 606
        width: 61
        height: 16
        text: qsTr("Line 3")
        checkable: true
        checked: false
		visible : false
    }

    TabButton {
        id: graphnelgroup
        x: 675
        y: 606
        width: 89
        height: 16
        text: qsTr("Graphnel")
        checkable: true
        checked: false
    }
	
	TabButton {
        id: modethruster
        x: 775
        y: 606
        width: 89
        height: 16
        text: qsTr("thruster mode")
        checkable: true
        checked: false
    }
	
	TabButton {
        id: aggresivity
        x: 875
        y: 606
        width: 89
        height: 16
        text: qsTr("aggresivity")
        checkable: true
        checked: false
    }


}


Timer{
		id:controller_gui
		interval: 100
		repeat: true
		running: true
		onTriggered: {
			
			
			if (heading_keeping_button.checked == true || station_keeping_button.checked == true){
				slider.interactive = true
			} 
			else { 
				slider.interactive = false
				slider.value = heading_value.text
			}
			
			if (heading_keeping_button.checked || station_keeping_button.checked || sway_keeping_button.checked || autopilot_button.checked){
				arrowkanandepan_val.text = arrowkanandepan.rotation + "/" + arrowkanandepan_target.rotation 
				arrowkananbelakang_val.text = arrowkananbelakang.rotation + "/" + arrowkananbelakang_target.rotation 
				arrowkiribelakang_val.text = arrowkiribelakang.rotation + "/" + arrowkiribelakang_target.rotation 
				arrowkiridepan_val.text = arrowkiridepan.rotation + "/" + arrowkiridepan_target.rotation 
			
			} else {
				arrowkanandepan_val.text = arrowkanandepan.rotation
				arrowkananbelakang_val.text = arrowkananbelakang.rotation
				arrowkiribelakang_val.text = arrowkiribelakang.rotation
				arrowkiridepan_val.text = arrowkiridepan.rotation
			}
			
			
		}
		
}





}

