/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 31.03.14
 * Time: 13:42
 * To change this template use File | Settings | File Templates.
 */
package view.mediator {
import commands.GetPostsCommand;

import mx.core.FlexGlobals;

import data.vo.GroupVO;

public class GroupMediator {

    private var main:BestPosts;

    public function GroupMediator() {
        main = BestPosts(FlexGlobals.topLevelApplication);
    }

    public function click(group:GroupVO):void{
        new GetPostsCommand().run(group.id);
        main.m_TopGroupsTable.deselect();
    }

}
}
