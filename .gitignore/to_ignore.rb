test/coverage/

Ask Mentor
  I want to set the key for the test, but dont want to have to change it later
  when Im running the file. How can I set that up?


1. What objects play a part in this story. Make them classes
  Operations: -Encrypt
              -Decrypt
              -Crack Messages

  Classes:    -The Key
              -Date Offsets
              -Encryptor
                -coordinates work from command line data to RotationCalculator, Offset
                 Calculator, then through Rotator
                -Runner class
                -same for Decryptor
                -DO TEST even though it is a runner, checking output is correct
                -LOOK LIKE:
                  date=Date.today.strftime(DDMMYY)
                  e=Encryptor.new
                  key=e.encrypt(input_file, output_file, date)
                  puts "Created...with #{key}"
              -Decryptor
                -Looks similar to above encryptor
              -Cracker
                Either iterate through key (0-99999) to see if it returns end
                Or calculate date offset then key rotation based on end from text file
              -Character Map
              -Guess Evaluator for Cracker??
              -Output
              -Rotator
              method: rotate(letter, rotation, offset)
              -add rotation and offset
              -move letter the total from character map


2.Build any of the classes that I can understand in isolation without building other things

          The RotationCalculator
          for_key(key)
            hash:
            :a =>14
            :b => 16....

3. character map = [a,b,c,d....x,y,z,0,1,2,3...8,9, ,. ,,]
                                                  space, period, comma
        ie. if rotation is 4, x would = 1

# 4.key should be randomly generated

5. Message.txt in 4 letter chunks
  "This is my secret message." => "This", " is ", "my s", "ecre"
                               =>  ABCD    ABCD    ABCD    ABCD
                               =>  2539    2539    2539
                               =>  same rotations
6.I/O => (Search google.com for command line argument)
    ./lib/encrypt.rb   message.txt   encrypted.txt
    ruby file to run
                      existing file containing the input/unencrypted message

                                    file to be created holding encrypted message
                                    ...create file
