{-|

The help command.

|-}

module Hledger.Cli.Help (

   helpmode
  ,help'

  ) where

import Prelude ()
import Prelude.Compat
import Data.List
import System.Console.CmdArgs.Explicit

import Hledger.Data.RawOptions
import Hledger.Cli.CliOptions
import Hledger.Cli.DocFiles

helpmode = (defCommandMode $ ["help"] ++ aliases) {
  modeHelp = "show any of the hledger manuals" `withAliases` aliases
 ,modeGroupFlags = Group {
     groupUnnamed = []
    ,groupHidden = []
    ,groupNamed = []
    }
 }
  where aliases = []

-- | Print detailed help on various topics.
help' :: CliOpts -> IO ()
help' opts = do
  let args = listofstringopt "args" $ rawopts_ opts
  case args of
    []    -> putStrLn $
             "Choose a topic, eg: hledger help cli\n" ++
             intercalate ", " docTopics
    topic:_ -> printHelpForTopic topic

