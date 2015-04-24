package vk {


import flash.events.*;
import flash.net.*;

import vk.api.serialization.json.JSON;

public class VkConnector implements IVkService {

    public static const SENDMESSAGE:String = "sendMessage";
    public static const GETMESSAGES:String = "getMessages";
    public static const GETADS:String = "getAds";
    public static const GETUSERBALANCE:String = "getUserBalance";
    public static const GETAPPFRIENDS:String = "getAppFriends";
    public static const GETPROFILES:String = "getProfiles";
    public static const GETCITIES:String = "getCities";
    public static const EXECUTE:String = "execute";

    public static const PHOTOS_GET_ALBUMS:String = "photos.getAlbums";
    public static const PHOTOS_CREATE_ALBUM:String = "photos.createAlbum";
    public static const PHOTOS_GET_UPLOAD_SERVER:String = "photos.getUploadServer";
    public static const PHOTOS_SAVE_PHOTOS:String = "photos.save";
    public static const PHOTOS_EDIT:String = "photos.edit";


    private static const GROUPS_GET:String = "groups.get";
    private static const GROUPS_GET_BY_ID:String = "groups.getById";

    public static const WALL_GET:String = "wall.get";
    public static const WALL_POST:String = "wall.post";

    public static var API_URL:String = "https://api.vk.com/method/";


    private var VIEWER_ID:String;
    private var ACCESS_TOKEN:String;


    public function VkConnector(flashVars:Object):void {
        VIEWER_ID = flashVars["viewer_id"];
        ACCESS_TOKEN = flashVars["access_token"];
    }


    public function groupsGet(user_id:String, count:int, onComplete:Function):void {
        sendRequest(GROUPS_GET, {user_id: user_id, extended: "1", count: count.toString(), v: "5.15" }, onComplete);
    }

    public function groupsGetByID(group_ids:String, onComplete:Function):void {
        sendRequest(GROUPS_GET_BY_ID, {group_ids: group_ids, fields: "members_count", v: "5.16" }, onComplete);
    }


    public function wallGet(owner_id:String, count:int, onComplete:Function):void {
        sendRequest(WALL_GET, {owner_id: owner_id, count: count.toString(), v: "5.15" }, onComplete);
    }

    public function wallPost(owner_id:String, message:String, atts:String, onComplete:Function):void {
        sendRequest(WALL_POST, {owner_id: owner_id, message: message,
            attachments: atts, v: "5.16" }, onComplete);
    }


    public function sendRequest(method:String, params:Object, onComplete:Function):void {
        var loader:URLLoader = new URLLoader();
        var request:URLRequest = new URLRequest(API_URL + method);
        request.method = "POST";
        request.data = getParamsRequest(params);
        var onCompleteFunction:Function = function (e:Event):void {
            onCompleteLoader(e, onComplete);
        };
        loader.addEventListener(Event.COMPLETE, onCompleteFunction);
        loader.addEventListener(IOErrorEvent.IO_ERROR, onIoError);
        loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
        loader.load(request);
    }


    private function getParamsRequest(params:Object):URLVariables {
        var vars:URLVariables = new URLVariables();
        vars["access_token"] = ACCESS_TOKEN;
        for (var p:String in params) {
            vars[p] = params[p];
        }
        return vars;
    }

    private function onCompleteLoader(e:Event, onComplete:Function):void {
        //trace("VkConnector onCompleteLoader: " + e.target.data);
        var response:Object = vk.api.serialization.json.JSON.decode(e.target.data);
        //trace("VkConnector: " + response);
        if (onComplete != null) {
            if (response.error) {
                return;
            }
            onComplete(response);
        }
    }

    private function onIoError(e:IOErrorEvent):void {
        trace("VK IoError!", "IO Error! " + e);
    }

    private function onSecurityError(e:SecurityErrorEvent):void {
        trace("VK SecurityError!", "SecurityError! ");
    }


}
}