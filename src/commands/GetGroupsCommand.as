/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 03.04.14
 * Time: 9:58
 * To change this template use File | Settings | File Templates.
 */
package commands {
import data.TopGroups;
import data.groups.HumorData;

import mx.core.FlexGlobals;

import view.groups.TopGroupsTable;

import vk.IVkFacade;

import data.vo.DataConverter;
import data.vo.GroupVO;

public class GetGroupsCommand {

    private var vkFacade:IVkFacade;
    private var topGroupsTable:TopGroupsTable;


    public function GetGroupsCommand() {
        var main:BestPosts = BestPosts(FlexGlobals.topLevelApplication);
        topGroupsTable = main.m_TopGroupsTable;
        vkFacade = main.vkFacade;
    }


    public function run(groupsIds:String):void {
        trace(groupsIds);
        vkFacade.groupsGetByID(groupsIds, onTopGroupsSet);
    }

    private function onTopGroupsSet(result:Object):void {
        var groups:Vector.<GroupVO> = DataConverter.convertTopGroups(result.response);
        TopGroups.GROUPS = groups;
        topGroupsTable.setGroups(TopGroups.getGroups(HumorData.HUMOR), groups[0].id);
    }

}
}
