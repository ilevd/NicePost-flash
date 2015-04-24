/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 29.03.14
 * Time: 16:46
 * To change this template use File | Settings | File Templates.
 */
package vk {
public interface IVkFacade {

    /**
     * local connection
     */
    function showInstallBox():void;

    function resizeWindow(width:int, height:int):void;

    function inviteFriends():void;

    function wallPost(owner_id:String, message:String, atts:String, onComplete:Function):void;

    function addToLeftMenu():void;

    /**
     * http requests from flash
     */
    function groupsGet(user_id:String, count:int, onComplete:Function):void;

    function groupsGetByID(group_ids:String, onComplete:Function):void;

    function wallGet(id:String, count:int, onComplete:Function):void;

}
}
