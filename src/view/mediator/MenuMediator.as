/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 31.03.14
 * Time: 12:40
 * To change this template use File | Settings | File Templates.
 */
package view.mediator {
import commands.GetPostsCommand;

import data.TopGroups;

import data.TopGroups;

import data.TopGroups;

import mx.core.FlexGlobals;

import data.vo.GroupVO;

public class MenuMediator {

    private var main:BestPosts;
    private var clickCountArr:Array;



    public function MenuMediator() {
        trace("MenuController constructor");
        main = BestPosts(FlexGlobals.topLevelApplication);
        initArr();
    }

    private function initArr():void{
        clickCountArr = new Array();
        for( var i:uint = 0; i < TopGroups.MENU_NAMES.length; i ++){
            clickCountArr.push(0);
        }
        clickCountArr[0]++;
    }

    public function menuClick(index:uint):void {
        if(index == TopGroups.GROUPS_NAMES.length){
            clickGroups(TopGroups.SELF_GROUPS, index);
        }else{
            click(TopGroups.GROUPS_NAMES[index], index);
        }
    }

    private function click(groupsNamesArr:Array, index:int):void {
        clickGroups(TopGroups.getGroups(groupsNamesArr), index);
    }

    private function clickGroups(groups:Vector.<GroupVO>, index:int):void {
        var groupIndex:uint = Math.random() * groups.length;
        //var groupIndex:int = clickCountArr[index];
        main.m_TopGroupsTable.setGroups(groups, groups[groupIndex].id);
        new GetPostsCommand().run(groups[groupIndex].id);
        //clickCountArr[index] = (groupIndex + 1) % groups.length;
    }

}
}
