/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 03.04.14
 * Time: 9:44
 * To change this template use File | Settings | File Templates.
 */
package commands {
import mx.core.FlexGlobals;

import view.LoadingWindow;
import view.posts.Wall;

import vk.IVkFacade;

import data.vo.DataConverter;
import data.vo.post.PostVO;

public class GetPostsCommand {

    private var loadingWindow:LoadingWindow;
    private var vkFacade:IVkFacade;
    private var board:Wall;

    public function GetPostsCommand() {
        var main:BestPosts = BestPosts(FlexGlobals.topLevelApplication);
        loadingWindow = main.m_LoadingWindow;
        vkFacade = main.vkFacade;
        board = main.m_Board;
    }


    public function run(groupID:String, count:int = 60):void {
        loadingWindow.show();
        //trace("BestPosts getPosts: " + groupID + " " + count);
        vkFacade.wallGet("-" + groupID, count, onPostsGet);
    }

    public function onPostsGet(result:Object):void {
        loadingWindow.hide();
        var posts:Vector.<PostVO> = DataConverter.convertPosts(result.response);
        board.setPosts(posts);
    }


}
}
