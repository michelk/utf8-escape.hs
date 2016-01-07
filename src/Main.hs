module Main where
import Options.Applicative
import qualified Data.Text.Lazy as T
import qualified Data.Text.Lazy.IO as TIO
import Data.Text.Lazy.Builder
import UTF8escape

data Options =
  Options {optFormat:: String }

cfg :: Parser Options
cfg =
  Options <$>
   strOption (short 't' <> long "to" <> metavar "FORMAT" <> value "html" <>
                help "Output format ('html', 'latexj')")

parser:: ParserInfo Options
parser =
  info (helper <*> cfg)
       (fullDesc <> header "Program to escape utf8-characters for html and latex" )


escape :: String -> T.Text -> T.Text
escape s =  toLazyText . ( dispatchFormat s) . T.toStrict

main :: IO ()
main =
  do (Options f) <- execParser parser
     TIO.interact ( escape f)
