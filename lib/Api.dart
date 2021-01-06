import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';
const CHAVE_YOUTUBE_API = 'AIzaSyD1g1XY28Ks_dP_uDIQg21AXeqAwGhgdFA';

const ID_CANAL = 'UCH2VZQBLFTOp6I_qgnBJCuQ';

const URL_BASE = 'https://www.googleapis.com/youtube/v3/';



class Api{

  Future<List<Video>>pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + 'search'
          '?part=snippet'
          '&type=video'
          '&maxResults=20'
          '&order=date'
          '&key=$CHAVE_YOUTUBE_API'
          '&channelId=$ID_CANAL'
          '&q=$pesquisa'
    );

    if(response.statusCode == 200){


        Map<String,dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = dadosJson['items'].map<Video>(
            (map){
             // return Video.converterJson(map);
              return Video.fromJson(map);
            }
        ).toList();

        return videos;

        /*
        for(var video in dadosJson['items']){

        }*/
       // print('Deu certo' + dadosJson['items'][1]['snippet']['title'].toString());
    }
    else{

    }

  }
}