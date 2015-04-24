/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 03.04.14
 * Time: 16:08
 * To change this template use File | Settings | File Templates.
 */
package view.mediator {
import commands.*;

import data.vo.post.PostVO;

public class GroupWindowItemMediator {

    public function GroupWindowItemMediator() {
    }

    public function click(uid:String, post:PostVO):void{
        new WallPostCommand().run(uid, post, false);
    }


}
}
