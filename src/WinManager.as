/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 10.08.13
 * Time: 13:53
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.Event;
import flash.events.MouseEvent;

import mx.core.FlexGlobals;
import mx.core.IFlexDisplayObject;
import mx.managers.PopUpManager;

import skins.HScrollSkin.HScrollSkin;
import skins.VScrollSkin.ScrollSkin;

import view.ImageWindow;
import view.friends.FriendsWindow;
import view.groupspost.GroupsWindow;

import data.vo.post.PostVO;

import view.invite.InviteWindow;
import view.today.TodayWindow;

public class WinManager {


    private static var winManager:WinManager;

    private var main:BestPosts;

    private var friendWindow:FriendsWindow;
    private var groupsWindow:GroupsWindow;
    private var imageWindow:ImageWindow;
    private var inviteWindow:InviteWindow;
    private var todayWindow:TodayWindow;

    private var mx:Number, my:Number;

    public function WinManager() {
        if (winManager) {
            throw new Error("WinManager is singleton!");
        } else {
            winManager = this;
        }
        trace("WinManager: init");
        init();
    }

    public static function get $():WinManager {
        return winManager ||= new WinManager();
    }


    private function init():void {
        main = BestPosts(FlexGlobals.topLevelApplication);
        friendWindow = main.m_FriendWindow;
        groupsWindow = main.m_GroupsWindow;
        imageWindow = main.m_ImageWindow;
        inviteWindow = main.m_InviteWindow;
        todayWindow = main.m_TodayWindow;
        PopUpManager.addPopUp(friendWindow, main.windowContainer, false);
        PopUpManager.addPopUp(groupsWindow, main.windowContainer, false);
        PopUpManager.addPopUp(imageWindow, main.windowContainer, false);
        PopUpManager.addPopUp(inviteWindow, main.windowContainer, false);
        PopUpManager.addPopUp(todayWindow, main.windowContainer, false);
        groupsWindow.setFriends(FlashVarsService.ADMIN_GROUPS);
        friendWindow.setFriends(FlashVarsService.FRIENDS);
        friendWindow.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        groupsWindow.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        imageWindow.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        inviteWindow.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        todayWindow.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
    }

    private function onMouseDown(e:MouseEvent):void {
        mx = e.currentTarget.mouseX;
        my = e.currentTarget.mouseY;
        if (e.target.parent is ScrollSkin || e.target.parent is HScrollSkin) {
            return;
        }
        e.currentTarget.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
        e.currentTarget.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(e:Event):void {
        e.currentTarget.x += e.currentTarget.mouseX - mx;
        e.currentTarget.y += e.currentTarget.mouseY - my;
    }

    private function onMouseUp(e:MouseEvent):void {
        e.currentTarget.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP, onMouseDown);
    }

    private function show(window:IFlexDisplayObject, modal:Boolean = false):void {
        if (window.parent == null) {
            PopUpManager.addPopUp(window, main.windowContainer, modal);
        }
        PopUpManager.centerPopUp(window);
        PopUpManager.bringToFront(window);
    }


    public function showFriendsWindow(post:PostVO):void {
        show(friendWindow);
        friendWindow.show(post);
    }

    public function showGroupWindow(post:PostVO):void {
        show(groupsWindow);
        groupsWindow.show(post);
    }

    public function showInviteWindow():void {
        show(inviteWindow);
        inviteWindow.show();
    }

    public function showTodayWindow():void {
        todayWindow.show();
        show(todayWindow);
    }

    public function showImageWindow(src:String, post:PostVO, curIndex:uint):void{
        show(imageWindow);
        imageWindow.show(src, post, curIndex);
    }

}
}
