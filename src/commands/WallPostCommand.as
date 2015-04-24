/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 31.03.14
 * Time: 18:37
 * To change this template use File | Settings | File Templates.
 */
package commands {
import mx.core.FlexGlobals;

import vk.IVkFacade;

import data.vo.post.PostVO;

public class WallPostCommand {

    private static const GALKA_SMILE:String =  "&#10004;";
    private static const HAND_SMILE:String =  "&#128077;";

    public function WallPostCommand() {
    }

    public function run(viewerID:String, post:PostVO, addLink:Boolean = true):void {
        trace("WallPostCommand viewerID: " + viewerID);
        var message:String = addLink ? addLinkText(post.text) : post.text;
        var vkFacade:IVkFacade = BestPosts(FlexGlobals.topLevelApplication).vkFacade;
        vkFacade.wallPost(viewerID, message, post.getAtts(addLink), null);
    }

    private function addLinkText(text:String):String {
        if (text.indexOf("NicePost") == -1) {
            if (text != "") {
                text += "\n\n";
            }
            text += "Всё лучшее тут: vk.com/NicePost";
            if (text.indexOf(GALKA_SMILE) == -1 && text.indexOf(HAND_SMILE) == -1) {
                text += " " + GALKA_SMILE + HAND_SMILE;
            }
        }
        return text;
    }

}
}
