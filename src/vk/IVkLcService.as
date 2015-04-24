/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 29.03.14
 * Time: 16:39
 * To change this template use File | Settings | File Templates.
 */
package vk {

/**
 * Local Connection, for call js function like as "showInviteBox"...
 */
public interface IVkLcService {

    function showInstallBox():void;

    function resizeWindow(width:int, height:int):void;

    function inviteFriends():void;

}
}
