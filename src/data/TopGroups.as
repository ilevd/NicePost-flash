/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 21:14
 * To change this template use File | Settings | File Templates.
 */
package data {
import data.groups.AutoData;
import data.groups.BrainData;
import data.groups.BusinessData;
import data.groups.CardsData;
import data.groups.EnglishData;
import data.groups.FashionData;
import data.groups.GamesData;
import data.groups.HumorData;
import data.groups.ImagesData;
import data.groups.LoveData;
import data.groups.MusicData;
import data.groups.NewsData;
import data.groups.QuotesData;
import data.groups.ReceiptsData;
import data.groups.SportData;
import data.vo.GroupVO;

public class TopGroups {

    public static var GROUPS:Vector.<GroupVO> = new Vector.<GroupVO>();
    public static var SELF_GROUPS:Vector.<GroupVO> = new Vector.<GroupVO>();


    public static var GROUPS_NAMES:Array;

    public static var MENU_NAMES:Array= [
        "Юмор","Любовь", "Новости", "Картинки", "Умное", "Цитаты",
        "Музыка", "Игры", "Спорт", "Авто", "Бизнес",
        "Мода", "Рецепты", "English", "Открытки",
        "Мои"
    ];

    public static function init():void {
        GROUPS_NAMES = [

            HumorData.HUMOR,
            LoveData.LOVE,
            NewsData.NEWS,
            ImagesData.IMAGES,
            BrainData.BRAIN,
            QuotesData.DATA,

            MusicData.MUSIC,
            GamesData.GAMES,
            SportData.SPORT,
            AutoData.AUTO,
            BusinessData.BUSINESS,


            FashionData.FASHION,
            ReceiptsData.RECEPTS,
            EnglishData.ENGLISH,
            CardsData.CARDS
        ];

    }

    public static function getAllGroups():String {
        var arr:Array = [];
        for(var i:uint = 0; i < GROUPS_NAMES.length; i ++){
            arr = arr.concat(GROUPS_NAMES[i]);
        }
        return arr.join(",");
        //return POPULAR.concat(SPORT).concat(BRAIN).
        //        concat(NEWS).concat(LOVE).concat(AUTO).
        //        concat(RECEPTS).concat(MUSIC).concat(IMAGES).concat(GAMES).join(",");
    }

    public static function getGroups(arr:Array):Vector.<GroupVO> {
        var groups:Vector.<GroupVO> = new Vector.<GroupVO>();
        for (var i:uint = 0; i < GROUPS.length; i++) {
            for (var j:uint = 0; j < arr.length; j++) {
                if (GROUPS[i].screen_name == arr[j]) {
                    groups.push(GROUPS[i]);
                }
            }
        }
        return groups;
    }


    /*public static const ANIMALS:Array = [
        "bez_kota",
    ];

    public static const FILMS:Array = [
        "hd_kino_mania",
        "onlinekinoteatr",
        "xfilm",
        "sseriess",
        "kinopoisk"
    ];*/



    public function TopGroups() {

    }
}
}
