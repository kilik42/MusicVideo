//
//  MusicVideo.swift
//  MusicVideoApp
//
//  Created by marvin evins on 6/24/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import Foundation


class Videos {
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl: String
    private var _vVideoUrl: String
    
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    
    private var _vImid:String
    private var _vGenre: String
    private var _vLinkToitunes: String
    private var _vReleaseDte: String
    
    
    //this variable gets created from the UI
    var vImageData:NSData?
    
    
    //creating my getters
    var vName: String {
        return _vName
    }
    
    var vImageUrl: String {
        return _vImageUrl
    }
    
    var vVideoUrl:String {
        return _vVideoUrl
    }
    
    var vRights: String{
        return _vRights
    }
    
    var vPrice:String{
        return _vPrice
    }
    
    var vArtist: String{
        return _vArtist
    }
    
    var vImid: String{
        return _vImid
    }
    
    var vGenre: String{
        return _vGenre
    }
    
    var vLinkToiTunes: String{
        return _vLinkToitunes
    }
    
    var vReleaseDte: String{
        return _vReleaseDte
    }
    init(data: JSONDictionary) {
        //video name
        if let name = data["im:name"] as? JSONDictionary,
            vName = name["label"] as? String {
                self._vName = vName
        }else{
            
            _vName = ""
        }
        
        ///video image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
            _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }else{
            _vImageUrl = ""
        }
        
        //video url
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
             vHref = vUrl["attributes"] as? JSONDictionary,
               vVideoUrl = vHref["href"] as? String {
            self._vVideoUrl = vVideoUrl
        } else{
            _vVideoUrl = ""
        }
        
        //video rights
        if let rights = data["rights"] as? JSONDictionary,
            vRights = rights["label"] as? String{
            self._vRights = vRights
        } else {
            _vRights = " "
        }
        
        //video price
        if let price = data["im:price"] as? JSONDictionary,
            vPrice = price["label"] as? String {
                self._vPrice = vPrice
        }else{
            _vPrice = ""
        }
        
        
        //video artist
        if let artist = data["im:artist"] as? JSONDictionary,
            vArtist = artist["label"] as? String{
            self._vArtist = vArtist
        }else{
            _vArtist = ""
        }
        
        //video imid
        
        if let imid = data["id"] as? JSONDictionary,
            vid = imid["attributes"] as? JSONDictionary,
            vImid = vid["im:id"] as? String {
            self._vImid = vImid
        }else {
            _vImid = ""
        }
        
        //video genre
        if let genre = data["category"] as? JSONDictionary,
            attributes = genre["attributes"] as? JSONDictionary,
            vGenre = attributes["term"] as? String {
             self._vGenre =  vGenre
        }else {
            _vGenre = ""
        }
        
        
        //video link to itunes
        
        if let release2 = data["id"] as? JSONDictionary,
           vLinkToiTunes = release2["label"] as? String
        {
            self._vLinkToitunes = vLinkToiTunes
        }else {
            _vLinkToitunes  = ""
        }
        
        //video release date
        
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
            attributes = releaseDate["attributes"] as? JSONDictionary,
            vReleaseDte = attributes["label"] as? String {
            self._vReleaseDte = vReleaseDte
        }else{
            _vReleaseDte = ""
        }
        
    }
    
    
}
