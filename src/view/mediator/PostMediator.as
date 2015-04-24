/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 31.03.14
 * Time: 13:28
 * To change this template use File | Settings | File Templates.
 */
package view.mediator {
import commands.WallPostCommand;

import flash.net.URLRequest;
import flash.net.navigateToURL;

import mx.core.FlexGlobals;

import vk.IVkFacade;

import data.vo.post.PostVO;


public class PostMediator {

    private var vkFacade:IVkFacade;
    private var main:BestPosts;

    public function PostMediator() {
        main = BestPosts(FlexGlobals.topLevelApplication);
    }

    public function navigateClick(post:PostVO):void{
        navigateToURL(new URLRequest('http://vk.com/wall' + post.owner_id + "_" + post.id), "_blank");
    }


    public function postSelfClick(post:PostVO):void {
        new WallPostCommand().run(FlashVarsService.VIEWER_ID, post);
    }


    public function postFriendClick(post:PostVO):void{
        WinManager.$.showFriendsWindow(post);
    }

    public function postGroupClick(post:PostVO):void{
        WinManager.$.showGroupWindow(post);
    }

    public function imageClick(src:String, post:PostVO, curIndex:uint):void{
        WinManager.$.showImageWindow(src, post, curIndex);
    }

}
}
