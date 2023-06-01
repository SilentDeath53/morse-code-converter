morseCode = struct('A', '.-', 'B', '-...', 'C', '-.-.', 'D', '-..', 'E', '.', ...
    'F', '..-.', 'G', '--.', 'H', '....', 'I', '..', 'J', '.---', 'K', '-.-', ...
    'L', '.-..', 'M', '--', 'N', '-.', 'O', '---', 'P', '.--.', 'Q', '--.-', ...
    'R', '.-.', 'S', '...', 'T', '-', 'U', '..-', 'V', '...-', 'W', '.--', ...
    'X', '-..-', 'Y', '-.--', 'Z', '--..', '0', '-----', '1', '.----', ...
    '2', '..---', '3', '...--', '4', '....-', '5', '.....', '6', '-....', ...
    '7', '--...', '8', '---..', '9', '----.', '.', '.-.-.-', ',', '--..--', ...
    '?', '..--..', '!', '-.-.--', ' ', '/');

function morse = textToMorse(text)
    text = upper(text);
    morse = '';
    for i = 1:numel(text)
        charToConvert = text(i);
        if isfield(morseCode, charToConvert)
            morse = [morse morseCode.(charToConvert) ' '];
        else
            morse = [morse ' '];
        end
    end
end

function text = morseToText(morse)
    words = strsplit(morse, '/');
    text = '';
    for i = 1:numel(words)
        letters = strsplit(words{i});
        for j = 1:numel(letters)
            morseChar = letters{j};
            found = false;
            fields = fieldnames(morseCode);
            for k = 1:numel(fields)
                if strcmp(morseCode.(fields{k}), morseChar)
                    text = [text fields{k}];
                    found = true;
                    break;
                end
            end
            if ~found
                text = [text '?'];
            end
        end
        text = [text ' '];
    end
end

text = 'HELLO WORLD';
morse = textToMorse(text);
disp(['Text: ' text]);
disp(['Morse Code: ' morse]);

convertedText = morseToText(morse);
disp(['Converted Text: ' convertedText]);
