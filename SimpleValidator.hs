{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE TemplateHaskell     #-}
{-# LANGUAGE ScopedTypeVariables #-}

module SimpleValidator where

import PlutusTx
import PlutusTx.Prelude
import Plutus.V1.Ledger.Contexts
import Plutus.V1.Ledger.Scripts

-- Simple validator that always returns True
{-# INLINABLE mkValidator #-}
mkValidator :: BuiltinData -> BuiltinData -> BuiltinData -> ()
mkValidator _ _ _ = ()

validator :: Validator
validator = mkValidatorScript $$(PlutusTx.compile [|| mkValidator ||])

validatorHash :: ValidatorHash
validatorHash = validatorHash validator
