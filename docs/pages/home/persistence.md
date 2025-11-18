# Persistence

## Overview

Figgy stores all changes made and saved through the :Interface: in a JSON file inside your project's [Included Files](https://manual.gamemaker.io/lts/en/Settings/Included_Files.htm). This keeps your configs bundled directly with the project, so they can be committed, versioned, and restored through your GitHub repository.

You can customize the output file's name and extension using the :FIGGY_FILE_NAME: and :FIGGY_FILE_EXT: config macros. By default, Figgy saves configs into a file named `"config.figgy"`.

## Deltas

By default, Figgy saves only the values you've changed through the :Interface: (AKA "deltas" or "diffs"), keeping the savefile small and making saving/loading faster. If you prefer to write out the entire config instead, you can disable this behavior by setting the :FIGGY_FILE_DELTA: config macro to `false`.

## Prettify

By default, Figgy formats the output JSON for readability (AKA [prettifies JSON](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/File_Handling/Encoding_And_Hashing/json_stringify.htm#:~:text=Example%202%3A%20Pretty%20Print)). If you prefer compact JSON instead, you can disable this by setting the :FIGGY_FILE_PRETTIFY: macro to false.

## Obfuscate

Figgy supports basic file obfuscation using [base64_encode()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/File_Handling/Encoding_And_Hashing/base64_encode.htm) and [buffer_compress()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Buffers/buffer_compress.htm), helping prevent players from casually editing your config file.

This behavior can be enabled by setting the :FIGGY_FILE_OBFUSCATE: config macro to `true`. If the current save file doesn't match the new obfuscation state (e.g. you turn obfuscation on or off), Figgy will still load it correctly and immediately re-save it using the updated setting.
