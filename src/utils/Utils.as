package utils {
import flash.utils.ByteArray;
import flash.xml.XMLDocument;

import spark.components.Label;

import data.vo.UserInfoVO;

public class Utils {


    public static function unixTimeToStr(unixTime:Number):String{
            var date:Date = new Date(unixTime*1000);
            var day:Number = date.getDate();
            var month:Number = date.getMonth();
            var year:Number = date.getFullYear();
            var hours:Number = date.getHours();
            var minutes:Number = date.getMinutes();
            var timeStr:String = hours < 10 ? "0" + hours : hours.toString();
            timeStr += ":" + (minutes < 10 ? "0" + minutes : minutes.toString());

            var nowDate:Date = new Date();
            var dayStr:String = "";
            if( nowDate.getDate() == day && nowDate.getMonth() == month && nowDate.getFullYear() == year){
                dayStr = "сегодня в ";
            } else
            if( nowDate.getDate() == day+1 && nowDate.getMonth() == month && nowDate.getFullYear() == year){
                dayStr = "вчера в ";
            } else{
                dayStr = day + " " +  getMonth(month) + " в ";
            }
            return dayStr + timeStr;
    }

    public static function getDate():String{
        var nowDate:Date = new Date();
        var month:Number = nowDate.getMonth();
        var day:Number = nowDate.getDate();
        return day + " " + getMonth(month);
    }


    private static function getMonth(m:Number):String{
        var arr:Array = ["января", "февраля", "марта", "апреля", "мая", "июня",
            "июля","августа",  "сентября", "октября", "ноябаря", "декабря" ];
        return arr[m];
    }


    public static function getTimeStr():String {
        var time:Date = new Date();

        var seconds:uint = time.getSeconds();
        var minutes:uint = time.getMinutes();
        var hours:uint = time.getHours();

        var str:String = hours < 10 ? "0" + hours : hours.toString();
        str += ":" + (minutes < 10 ? "0" + minutes : minutes.toString());
        return str;
    }


    public static function clone(source:Object):* {
        var copier:ByteArray = new ByteArray();
        copier.writeObject(source);
        copier.position = 0;
        return(copier.readObject());
    }


    public static function rollOut(label:Label):void {
        label.setStyle("textDecoration", "none");
    }

    public static function rollOver(label:Label):void {
        label.setStyle("textDecoration", "underline");
    }


    public static function needReplaceImgSource(url:String):Boolean {
        var urls:Array = [ "http://vk.com/images/deactivated_a.gif",
            "http://vk.com/images/deactivated_b.gif",
            "http://vk.com/images/deactivated_c.gif",
            "http://vkontakte.com/images/deactivated_a.gif",
            "http://vkontakte.com/images/deactivated_b.gif",
            "http://vkontakte.com/images/deactivated_c.gif",

            "http://vkontakte.ru/images/question_a.gif",
            "http://vkontakte.ru/images/question_b.gif",
            "http://vkontakte.ru/images/question_c.gif",
            "http://vkontakte.ru/images/question_d.gif",

            "http://vk.com/images/question_a.gif",
            "http://vk.com/images/question_b.gif",
            "http://vk.com/images/question_c.gif",
            "http://vk.com/images/question_d.gif",

            "http://vk.com/images/camera_a.gif",
            "http://vk.com/images/camera_b.gif",
            "http://vk.com/images/camera_c.gif",


            "http://vkontakte.ru/images/camera_a.gif",
            "http://vkontakte.ru/images/camera_b.gif",
            "http://vkontakte.ru/images/camera_c.gif"

        ];

        for (var i:uint = 0; i < urls.length; i++) {
            if (url == urls[i]) {
                return true;
            }
        }

        return false;
    }


    public static function getAge(bdate:String):uint {
        if (!bdate) return 0;
        var bdateArr:Array = bdate.split(".");
        for (var i:uint = 0; i < bdateArr.length; i++) {
            if (String(bdateArr[i]).length == 4) {
                return uint(bdateArr[i]);
            }
        }
        return 0;
    }


    public static function getDateString(date:Number):String {
        var d:Date = new Date(date * 1000);
        return (d.hours >= 10 ? d.hours.toString() : ("0" + d.hours)) + ":" +
                (d.minutes >= 10 ? d.minutes.toString() : ("0" + d.minutes)) + " " +
                (d.date >= 10 ? d.date.toString() : ("0" + d.date)) + "." +
                (d.month >= 10 ? (d.month + 1).toString() : ("0" + (d.month + 1))) + "." + d.fullYear;

    }

    public static function getMarkStr(mark:uint):String {
        switch (mark) {
            case 1:
                return "";
            case 2:
            case 3:
            case 4:
                return "а";
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return "ов";
        }
        return "ов";
    }


    private function addCityNameToUser(result:Object):Object {
        for (var i:uint = 0; i < (result.users as Array).length; i++) {
            (result.users as Array)[i].city_name = getCityNameByID((result.users as Array)[i].city, result.cities as Array);
        }
        return result.users;
    }


    private static function getCityNameByID(cid:*, cities:Array):String {
        if (cid == null) return "";
        for (var i:uint = 0; i < cities.length; i++) {
            if (cities[i].cid == cid) {
                return cities[i].name;
            }
        }
        return "";
    }


    private static function getVkUser(uid:String, vkUsers:Array):Object {
        for (var i:uint = 0; i < vkUsers.length; i++) {
            if (vkUsers[i].uid == uid)
                return vkUsers[i];
        }
        return null;
    }


    public static function getMark(mark:Number):String {
        mark = mark / 2;
        return String(mark > 5 ? "5+" : mark).substr(0, 3);
    }

    /*public static function replaceImgSource(url:String):Object {
        if( url.indexOf(".jpg") != url.length - 4){
            return ResManager.QUESTION_AVA;
        }

        var urls:Array = [ "http://vk.com/images/deactivated_a.gif",
            "http://vk.com/images/deactivated_b.gif",
            "http://vk.com/images/deactivated_c.gif",
            "http://vkontakte.com/images/deactivated_a.gif",
            "http://vkontakte.com/images/deactivated_b.gif",
            "http://vkontakte.com/images/deactivated_c.gif",

            "http://vkontakte.ru/images/question_a.gif",
            "http://vkontakte.ru/images/question_b.gif",
            "http://vkontakte.ru/images/question_c.gif",
            "http://vkontakte.ru/images/question_d.gif",

            "http://vk.com/images/question_a.gif",
            "http://vk.com/images/question_b.gif",
            "http://vk.com/images/question_c.gif",
            "http://vk.com/images/question_d.gif",

            "http://vk.com/images/camera_a.gif",
            "http://vk.com/images/camera_b.gif",
            "http://vk.com/images/camera_c.gif",


            "http://vkontakte.ru/images/camera_a.gif",
            "http://vkontakte.ru/images/camera_b.gif",
            "http://vkontakte.ru/images/camera_c.gif"

        ];



        for (var i:uint = 0; i < urls.length; i++) {
            if (url == urls[i]) {
                return ResManager.QUESTION_AVA;
            }
        }
        return url;
    }   */


    public static function htmlEntityString(s:String):String {
        if (s == "" || s == null) return "";
        s = replaceDoubleShashUnicode(s);
        return new XMLDocument(s).firstChild.nodeValue;
    }

    private static function replaceDoubleShashUnicode(s:String):String {
        var ss:String = "";
        for (var i:uint = 0; i < s.length; i++) {
            if (s.charAt(i) == "\\" && s.length >= i + 6 && s.charAt(i + 1) == "u") {
                var v:String = s.substr(i + 2, 4);
                //trace("v: " + v);
                ss += String.fromCharCode("0x" + v);
                i += 5;
            } else {
                ss += s.charAt(i);
            }
        }
        return ss;
    }


    public static function getUserInfoTooltip(user:UserInfoVO):String {
        var str:String = "";
        str = user.first_name;
        str += (user.city_name == "" || user.city_name == null ? "" : (", " + user.city_name) );
        if (user.age != 0) {
            str += ", " + user.age;
        }
        return str;
    }

    public static function secondsToTimeString(time:uint):String {
        var seconds:uint = time % 60;
        var minutes:uint = uint(time / 60);
        return (minutes < 10 ? "0" : "") + minutes.toString() + ":" +
                (seconds < 10 ? "0" : "") + seconds.toString();
    }


    public static function getMoneyStr(monet:uint):String {
        if (monet >= 10 && monet <= 14) return "";
        switch (monet % 10) {
            case 1:
                return "у";
            case 2:
            case 3:
            case 4:
                return "ы";
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return "";
        }
        return "";
    }

    public static function getMonetStr1(monet:uint):String {
        if (monet >= 10 && monet <= 14) return "";
        switch (monet) {
            case 1:
                return "а";
                break;
            case 2:
            case 3:
            case 4:
                return "ы";
                break;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                return "";
                break;
            default:
                return "";
                break;
        }
        return "";
    }


    public static function getChatRoomByAge(bdate:int):int {
        if (bdate == 0) return 1;
        var age:uint = 2013 - bdate;
        if (age <= 13) return 1;
        if (age == 14 || age == 15) return 2;
        if (age == 16 || age == 17) return 3;
        if (age >= 18 && age <= 22) return 4;
        return 5;
    }

}
}