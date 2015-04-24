/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 8:57
 * To change this template use File | Settings | File Templates.
 */
package vk {
public class VkService implements IVkLcService {

    private static const WALL_GET:String = "wall.get";
    private static const GROUPS_GET:String = "groups.get";
    private static const GROUPS_GET_BY_ID:String = "groups.getById";
    private static const WALL_POST:String = "wall.post";


    private var apiConnection:APIConnection

    public function VkService(flashVars:Object) {
        apiConnection = new APIConnection(flashVars);
    }

    public function showInstallBox():void {
        apiConnection.callMethod("showInstallBox");
    }

    public function resizeWindow(w:int, h:int):void {
        apiConnection.callMethod("resizeWindow", w, h);
    }

    public function inviteFriends():void {
        apiConnection.callMethod("showInviteBox");
    }

    public function addToLeftMenu():void{
        apiConnection.callMethod("showSettingsBox", 256);
    }

    public function wallPost(owner_id:String, message:String, atts:String, onComplete:Function):void {
        //trace("vkServivce wallPost: " + owner_id +  " " + message );
        var params:Object = {owner_id: owner_id, message: message,
            attachments: atts, v: "5.16" };
        if( owner_id.charAt(0) == "-"){
            params.from_group = 1;
            //params.message = "tetst";
            //trace("vkService fromGroup");
        }
        sendRequest(WALL_POST, params, onComplete);
    }


    private function sendRequest(method:String, params:Object, onComplete:Function):void {
        trace("VKService send req: " + method);
        for (var p:String in params) {
            trace("VKService params: " + p + " : " + params[p]);
        }
        apiConnection.api(method, params, function (result:Object):void {
                    trace("VKService result: " + result);
                    if (onComplete != null) {
                        onComplete(result);
                    }
                },
                onError);
    }

    private function onError(o:Object):void {
        trace("VKService Error: " + o);
    }


}
}
