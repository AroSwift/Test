# WebComp

# Project Name: WebComp

# Summary
  WebComp utilizes pattern recognition in neural networks for the purpose of deriving aesthetic preferences based on a series of webpage comparisons. The interface includes: a training page to add weight (or create preference) and a results window that showcases the networks statistical analysis of its training.

# Group Participants: Aaron Barlow, Kirolos Shahat, and David DaSilva

# Installation
1. sudo gem install rails
2. bundle install
3. brew install libxml2
4. brew install pkgconfig
5. brew install imagemagick --disable-openmp OR gem install rmagick -v 6. '2.13.2 instead of step 5 & 6
7. sudo link imagemagick
8. rails server
9. Wait until loads
10. Go to browser and put in "localhost:3000"
Note: This is not an exhaustive explanation for setting up the environment from which the neural network may be run.

# Compare Websites
Rails: Get two website urls from user
Rails: Validate website urls (make sure they exist)
Ruby: Go to the first website and take a screenshot of the current website and repeat this step once
Ruby: Call C++ as “./webcompare”
C++: Open a file titled “neuralSettings.txt” has the appropriate weights of the NN and updates those values so the NN is back to what it was in the last instance of the program and then close the file
C++: Potential addition:
Open the first image file and convert the image into the appropriate ascii values and store that image into a new output file titled “firstImgConv.txt”. This will be repeated one more time for the second image file into a new output file titled “secondImgConv.txt”
These will be the files that are compared
C++: Check to see how many arguments were passed with the call.
    (needed to know if it’s comparing websites or training the neural network)
If no arguments then the program is fully functional and not being tested.
C++: Open the first file and read in the values inside of it into a vector<string> named “firstImg”
The strings will be the ascii values that are the pictures
C++: Open the second file and read in the values inside of it into a vector<string> named “secondImg”
The strings will be the ascii values that are the pictures
C++: Pass the two vectors to the NN
C++: NN side – Still a big question mark
The big picture of the neural network is pattern recognition. It needs to compare the two vectors with the previously chosen selections and return it’s selection. Since this is in the execution of the “final” stage of the NN, it should already have data so it should not need to make educated guesses.
C++: The superior website is printed to an output file titled “finalSelections.txt”
The layout of the file would be:
Outputs: a double //which website it chose
Targets: an int //which website it should have chosen (website “1” or “2”)
Recent average error: a double //percentage error
Rails: read in “finalSelection.txt” and appropriate the corresponding instance variables and pass these to the view so that the user may see which website the neural network picked as the best along with the certainty of its decision.
Update the website compare view and displays the two images. The best image will have a green box around it and a red box around the image that is less visually pleasing.
Potential addition: allow the user to verify whether the neural network is correct via two buttons. If the neural network is correct, do nothing. Otherwise, call train neural network with an additional parameter indicating that the neural network was incorrect and allow the neural network to adjust the weights and confidence levels in order to improve future performance.
Present a link so that the user can put input two new links

Converting ASCII images to numbers
Read char by char, cast as integer

# Train Neural Network
Ruby: Randomize websites from “websites_list.txt”
Potential addition: replace this with a delayed job that runs in the background and gets words from a file and then searches bing (this caps out at 5,000 searches per month). The data miner would get one of the links on the page and then save that to a file.
Ruby: Go to two websites
Ruby: Save those two websites as images
Ruby: Convert those images to ascii
Potential addition: convert them later in C++. And remove this step.
Rails: Display images in train view
Rails: Allow user to select the best image by making the image a link.
Rails: Capture that input
Rails: Call C++ as “./webcompare  number_of_best_website”. Number_of_best_website equates to 1 or 2 which indicates the website the user thought was best. This is so that the neural network can determine whether or not it was correct.
C++: Check to see which int was passed from Ruby // 1 being first website, 2 being the second website
If the int was passed then it is in the training stage of the network
C++: Attempt to open a file called “neuralSettings.txt” which, if it exists, would contain the weights from the last run of the program. If it does not exist then the program is in its first run
If there is no file then the file is created at the end of the execution and the weights and values of the NN are randomized for this run
Otherwise the file does exist and the weights are set equal to the previous weights of the program run and then the file is closed.
C++: Potential addition:
Open the first image file and convert the image into the appropriate ascii values and store that image into a new output file titled “firstImgConv.txt”. This will be repeated one more time for the second image file into a new output file titled “secondImgConv.txt”
These will be the files that are compared
C++: Open the first file and read in the values inside of it into a vector<string> named firstImg;
The strings will be the ascii values that are the pictures
C++: Open the second file and read in the values inside of it into a vector<string> named secondImg;
The strings will be the ascii values that are the pictures
C++: Pass the two vectors to the NN
C++: NN side – Still a big question mark
The big picture of the neural network is pattern recognition. It needs to compare the two vectors with the previously chosen selections and return it’s selection, 1 or 2 representing the website it chose. Since this is in the training stage the values need to be random and it needs to know if it was wrong or right in it’s choice to update its weights.
C++: The superior website is printed to an output file titled “finalSelections.txt”
The layout of the file would be:
Outputs: a double //which website it chose
Targets: an int //which website it should have chosen
Recent average error: a double //percentage error
C++: The current weights are written into a file titled “neuralSettings.txt” and then file is closed.
If the file exists it is overwritten, otherwise it is created.
C++: The program terminates
Rails: repeats step one so that the user can continue to train the neural network.

![alt tag](https://raw.githubusercontent.com/AroSwift/WebComp/develop/app/assets/images/01.png)

![alt tag](https://raw.githubusercontent.com/AroSwift/WebComp/develop/app/assets/images/02.png)
