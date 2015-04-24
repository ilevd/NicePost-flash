/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 31.03.14
 * Time: 18:23
 * To change this template use File | Settings | File Templates.
 */
package view.mediator {
import commands.WallPostCommand;

import mx.core.FlexGlobals;

import view.friends.FriendsWindow;

import data.vo.post.PostVO;

public class FriendItemMediator {


    public function FriendItemMediator() {

    }

    public function click(uid:String, post:PostVO):void{
        new WallPostCommand().run(uid, post);
    }

}
}
