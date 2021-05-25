import DecodeToString ( decode )
import EncodeToTelephone ( encode )



test1 :: [[Int]]
test1 = encode "hola mundo"


test2 :: String
test2 = decode test1