/**
 * Created with IntelliJ IDEA.
 * User: igor
 * Date: 21.03.14
 * Time: 11:10
 * To change this template use File | Settings | File Templates.
 */
package data.vo {
import flash.media.Video;

import data.vo.post.AudioVO;
import data.vo.post.LikesVO;
import data.vo.post.LinkVO;
import data.vo.post.PhotoVO;
import data.vo.post.PostVO;
import data.vo.post.RepostsVO;
import data.vo.post.VideoVO;

public class DataConverter {

    public function DataConverter() {
    }

    public static function convertPosts(obj:Object):Vector.<PostVO> {

        var posts:Vector.<PostVO> = new Vector.<PostVO>();
        var postsArr:Array = obj.items as Array;

        for (var i:uint = 0; i < postsArr.length; i++) {
            var postVO:PostVO = new PostVO();
            var postObj:Object = postsArr[i];

            postVO.id = postObj.id;
            postVO.text = postObj.text;
            postVO.date = postObj.date;
            postVO.from_id = postObj.from_id;
            postVO.owner_id = postObj.owner_id;

            postVO.likes = new LikesVO();
            postVO.likes.count = postObj.likes.count;

            postVO.reposts = new RepostsVO();
            postVO.reposts.count = postObj.reposts.count;


            if (postObj.attachments) {
                var attachArr:Array = postObj.attachments as Array;
                getPhotos(postVO, attachArr);
            } else {
                getPhotos(postVO, []);
            }

            posts.push(postVO);
        }

        return posts.sort(compare);

    }

    private static function compare(post1:PostVO, post2:PostVO):int {
        if (post1.likes.count + post1.reposts.count >
                post2.likes.count + post2.reposts.count) return -1;
        return 1;
    }

    private static function getPhotos(postVO:PostVO, arr:Array):void {
        var photos:Vector.<PhotoVO> = new Vector.<PhotoVO>();
        var audios:Vector.<AudioVO> = new Vector.<AudioVO>();
        var videos:Vector.<VideoVO> = new Vector.<VideoVO>();
        var links:Vector.<LinkVO> = new Vector.<LinkVO>();

        for (var i:uint = 0; i < arr.length; i++) {

            if (arr[i].type == "photo") {
                var photoObj:Object = arr[i].photo;
                var photoVO:PhotoVO = new PhotoVO();
                photoVO.id = photoObj.id;
                photoVO.owner_id = photoObj.owner_id;
                photoVO.photo_75 = photoObj.photo_75;
                photoVO.photo_130 = photoObj.photo_130;
                photoVO.photo_604 = photoObj.photo_604;
                photos.push(photoVO);
            }

            if (arr[i].type == "video") {
                var obj:Object = arr[i].video;
                var videoVO:VideoVO = new VideoVO();
                videoVO.photo_130 = obj.photo_130;
                videoVO.id = obj.id;
                videoVO.owner_id = obj.owner_id;
                videoVO.title = obj.title;
                videoVO.photo_320 = obj.photo_320;
                videos.push(videoVO);
            }

            if (arr[i].type == "audio") {
                obj = arr[i].audio;
                var audioVO:AudioVO = new AudioVO();
                audioVO.id = obj.id;
                audioVO.artist = obj.artist;
                audioVO.title = obj.title;
                audioVO.owner_id = obj.owner_id;
                audios.push(audioVO);
            }

            if (arr[i].type == "link") {
                obj = arr[i].link;
                var linkVO:LinkVO = new LinkVO();
                linkVO.title = obj.title;
                linkVO.url = obj.url;
                links.push(linkVO);
            }
        }

        postVO.photos = photos;
        postVO.audios = audios;
        postVO.videos = videos;
        postVO.links = links;
    }


    public static function convertGroups(obj:Object):Vector.<GroupVO> {
        var groups:Vector.<GroupVO> = new Vector.<GroupVO>();
        var arr:Array = obj.items as Array;
        for (var i:uint = 0; i < arr.length; i++) {
            var gr:Object = arr[i];
            var group:GroupVO = new GroupVO();
            group.id = gr.id;
            group.name = gr.name;
            group.screen_name = gr.screen_name;
            group.type = gr.type;
            group.photo_100 = gr.photo_100;
            group.photo_200 = gr.photo_200;
            group.photo_50 = gr.photo_50;
            groups.push(group);
        }
        return groups;
    }

    public static function convertTopGroups(obj:Object):Vector.<GroupVO> {
        var groups:Vector.<GroupVO> = new Vector.<GroupVO>();
        var arr:Array = obj as Array;
        for (var i:uint = 0; i < arr.length; i++) {
            var gr:Object = arr[i];
            var group:GroupVO = new GroupVO();
            group.id = gr.id;
            group.name = gr.name;
            group.screen_name = gr.screen_name;
            group.type = gr.type;
            group.photo_100 = gr.photo_100;
            group.photo_200 = gr.photo_200;
            group.photo_50 = gr.photo_50;
            groups.push(group);
        }
        return groups;
    }


}
}
