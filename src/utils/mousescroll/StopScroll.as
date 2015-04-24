/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 13:46
 * To change this template use File | Settings | File Templates.
 */
package utils.mousescroll {
import flash.display.MovieClip;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.external.ExternalInterface;

public class StopScroll {

    static private var _mouseWheelTrapped :Boolean;

    public static function setup(mainStage:Stage):void {

        mainStage.addEventListener(MouseEvent.ROLL_OVER, function():void{
                    allowBrowserScroll(false);
                }
        );

        //i added 'mx.core.FlexGlobals.topLevelApplication.'making it work better for flex. use 'stage' for flash
        mainStage.addEventListener(MouseEvent.ROLL_OUT, function():void{
                    allowBrowserScroll(true);
                }
        );
    }

    private static function allowBrowserScroll(allow:Boolean):void
    {
        createMouseWheelTrap();
        if (ExternalInterface.available){
            ExternalInterface.call("allowBrowserScroll", allow);
        }
    }
    private static function createMouseWheelTrap():void
    {
        if (_mouseWheelTrapped) {return;} _mouseWheelTrapped = true;
        if (ExternalInterface.available){
            ExternalInterface.call("eval", "var browserScrolling;function allowBrowserScroll(value){browserScrolling=value;}function handle(delta){if(!browserScrolling){return false;}return true;}function wheel(event){var delta=0;if(!event){event=window.event;}if(event.wheelDelta){delta=event.wheelDelta/120;}else if(event.detail){delta=-event.detail/3;}if(delta){handle(delta);}if(!browserScrolling){if(event.preventDefault){event.preventDefault();}event.returnValue=false;}}if(window.addEventListener){window.addEventListener('DOMMouseScroll',wheel,false);}window.onmousewheel=document.onmousewheel=wheel;allowBrowserScroll(true);");
        }
    }



}
}
