/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 03.04.14
 * Time: 10:01
 * To change this template use File | Settings | File Templates.
 */
package commands {
import data.TopGroups;

import mx.core.FlexGlobals;

import vk.IVkFacade;

import data.vo.DataConverter;
import data.vo.GroupVO;

public class GetSelfGroupsCommand {

    private var vkFacade:IVkFacade;

    public function GetSelfGroupsCommand() {
        var main:BestPosts = BestPosts(FlexGlobals.topLevelApplication);
        vkFacade = main.vkFacade;
    }

    public function run():void {
        vkFacade.groupsGet(FlashVarsService.VIEWER_ID.toString(), 20, onGroupsGet);
    }

    private function onGroupsGet(result:Object):void {
        var groups:Vector.<GroupVO> = DataConverter.convertGroups(result.response);
        TopGroups.SELF_GROUPS = groups;
    }

}
}
