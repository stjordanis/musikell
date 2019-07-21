module Main where

import           Repository.Album
import           Repository.Artist
import           Repository.Song
import           Repository.Neo

main :: IO ()
main = do
  pool       <- mkPipePool
  songRepo   <- mkSongRepository pool
  albumRepo  <- mkAlbumRepository pool songRepo
  artistRepo <- mkArtistRepository pool
  createData artistRepo albumRepo songRepo
  showArtist artistRepo
  showAlbum albumRepo
  --showAlbumsForArtist albumRepo
