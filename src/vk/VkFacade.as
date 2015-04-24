/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 29.03.14
 * Time: 16:47
 * To change this template use File | Settings | File Templates.
 */
package vk {

public class VkFacade implements IVkFacade {


    private var vkService:VkService;
    private var vkConnector:VkConnector;


    public function VkFacade(flashVars:Object):void {
        vkService = new VkService(flashVars);
        vkConnector = new VkConnector(flashVars);
    }

    /**
     * Local connection func
     */
    public function showInstallBox():void {
        vkService.showInstallBox();
    }

    public function resizeWindow(width:int, height:int):void {
        vkService.resizeWindow(width, height);
    }

    public function inviteFriends():void {
        vkService.inviteFriends();
    }

    public function wallPost(owner_id:String, message:String, atts:String, onComplete:Function):void {
        vkService.wallPost(owner_id, message, atts, onComplete);
    }

    public function addToLeftMenu():void{
        vkService.addToLeftMenu();
    }

    /**
     * http requests from flash
     */
    public function groupsGet(user_id:String, count:int, onComplete:Function):void {
        vkConnector.groupsGet(user_id, count, onComplete);
    }

    public function groupsGetByID(group_ids:String, onComplete:Function):void {
        vkConnector.groupsGetByID(group_ids, onComplete);
    }

    public function wallGet(owner_id:String, count:int, onComplete:Function):void {
        vkConnector.wallGet(owner_id, count, onComplete);
    }


}
}
