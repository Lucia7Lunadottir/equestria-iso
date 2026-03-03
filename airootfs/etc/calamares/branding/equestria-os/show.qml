import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: advanceTimer
        interval: 30000
        running: true
        repeat: true
        onTriggered: nextSlide()
    }

    Slide {

        Image {
            id: background_1
            source: "slide-0.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {

        Image {
            id: background_2
            source: "slide-1.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }


        Slide {

        Image {
            id: background_3
            source: "slide-2.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    Slide {

        Image {
            id: background_4
            source: "slide-3.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    
        Slide {

        Image {
            id: background_5
            source: "slide-4.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
        
        Slide {

        Image {
            id: background_6
            source: "slide-5.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Slide {

        Image {
            id: background_7
            source: "slide-6.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Slide {

        Image {
            id: background_8
            source: "slide-7.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Slide {

        Image {
            id: background_9
            source: "slide-8.jpg"
            width: 1002; height: 651
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }

    function onActivate() {
        console.log("QML Component (default slideshow) activated");
        presentation.currentSlide = 0;
    }
    
    function onLeave() {
        console.log("QML Component (default slideshow) deactivated");
    }
}
