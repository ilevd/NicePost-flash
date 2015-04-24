/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 03.04.14
 * Time: 10:13
 * To change this template use File | Settings | File Templates.
 */
package commands {
import flash.events.TimerEvent;
import flash.utils.Timer;

import mx.core.FlexGlobals;

import vk.IVkFacade;

public class LeftMenuCommand {

    private var vkFacade:IVkFacade;
    private var timer:Timer = new Timer(30000, 1);

    public function LeftMenuCommand() {
        var main:BestPosts = BestPosts(FlexGlobals.topLevelApplication);
        vkFacade = main.vkFacade;
    }

    public function run():void {
        if ((FlashVarsService.API_SETTINGS & 256) != 256 /*&& Math.random() > 0.7*/) {
            WinManager.$.showInviteWindow();
        }
    }

    public function addToMenu():void{
        vkFacade.addToLeftMenu();
    }

    private function setTimer():void{
        timer.addEventListener(TimerEvent.TIMER_COMPLETE, function (e:TimerEvent):void {
            addToMenu();
        });
        timer.start();
    }

}
}
