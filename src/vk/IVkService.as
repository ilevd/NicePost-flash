/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 29.03.14
 * Time: 16:21
 * To change this template use File | Settings | File Templates.
 */
package vk {

public interface IVkService {


    function groupsGet(user_id:String, count:int, onComplete:Function):void;

    function groupsGetByID(group_ids:String, onComplete:Function):void;

    function wallGet(id:String, count:int, onComplete:Function):void;


}
}
