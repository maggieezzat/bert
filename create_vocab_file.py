from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
from os import listdir, remove
from os.path import isfile, join
import sys
from absl import app as absl_app
import tensorflow as tf
import tokenization

dir = "/media/maggie/New Volume/spacy_processed_text/"
#dir = "/media/maggie/New Volume/test/"
out = "/media/maggie/New Volume/"

def create_vocab(rootdir=dir, output=out):

    paths = listdir(rootdir)
    output_file = join(output, "vocab" + ".txt")
    
    with open(output_file, 'w+') as of:

        for path in paths:
            files = [
                f
                for f in listdir(join(rootdir, path))
                if isfile(join(rootdir, path, f))
            ]
            
            for file in files:
                file_path = join(rootdir, path, file)
                vocab = of.readlines()
                vocab = [x.strip() for x in vocab]
                
                with open(file_path, 'r+') as f:
                    #content = f.readlines()
                    #content = [x.strip() for x in content]
                    content = [word for line in f for word in line.split()]
                    print("file: " + file + str(len(content)) + '\n')
                    vocab_set = set(vocab)
                    content_set = set(content)
                    to_be_added = content_set - vocab_set
                    new_vocab = list(to_be_added)
                    #print(new_vocab)
                    for i in range(len(new_vocab)):
                        of.write(new_vocab[i] + '\n')

        
    tokenizer = tokenization.FullTokenizer(vocab_file=output_file, do_lower_case=False)

    with open(output_file, 'r') as vocab_file:
        tokenized_vocab=join(output, "tokenized_vocab" + ".txt")
        with open(tokenized_vocab, 'w') as tokenized_vocab_file:
            while True:
                line = tokenization.convert_to_unicode(vocab_file.readline())
                if not line:
                    break
                line = line.strip()
                token = tokenizer.tokenize(line)
                tokenized_vocab_file.write(token[0] + '\n')

   
        #133418
        #vocab = of.readlines()
        #print("================")
        #vocab = [x.strip() for x in vocab]
        #vocab_len = len(vocab)
        #print("vocab length:: " + str(vocab_len))


def get_unique_chars(rootdir=dir, output=out):
    paths = listdir(rootdir)
    output_file = join(output, "unique_chars" + ".txt")
    temp_file = join(output, "temp" + ".txt")

    total_dirs = len(paths)
    processed_dirs = 0

    with open(temp_file, 'w+') as of:

        for path in paths:
            processed_dirs+=1
            
            files = [
                f
                for f in listdir(join(rootdir, path))
                if isfile(join(rootdir, path, f))
            ]

            total_files = len(files)
            processed_files = 0
            
            for file in files:
                processed_files+=1
                print("Getting Unique Chars::: Directory "
                 + str(processed_dirs)+"/"+str(total_dirs) + " File::"
                 + str(processed_files)+"/"+str(total_files), end='\r')
                file_path = join(rootdir, path, file)
                vocab = of.read()
                vocab = [x.strip() for x in vocab]
                
                with open(file_path, 'r+') as f:
                    content = f.read()
                    content = [x.strip() for x in content]
                    vocab_set = set(vocab)
                    content_set = set(content)
                    to_be_added = content_set - vocab_set
                    new_vocab = list(to_be_added)
                    for item in new_vocab:
                        of.write(item)

    with open(output_file, 'w') as of:
        special_tokens = ["[PAD]", "[UNK]", "[CLS]", "[SEP]", "[MASK]"]
        for token in special_tokens:
            of.write(token + '\n')
        
        with open(temp_file, 'r') as f:
            content = f.read()
            content = [x.strip() for x in content]
            for char in content:
                of.write(char + '\n')
            for char in content:
                new_char = "##" + char
                of.write(new_char + '\n')


def main(_):
    #create_vocab()
    get_unique_chars()


if __name__ == "__main__":
    absl_app.run(main)