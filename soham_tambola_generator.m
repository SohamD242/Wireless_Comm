%Code Author:Soham Deshpande(BT21ECE083)
%Date:17/01/2024
clc
clear all;

% Define ranges for each column
numberRanges = {[1 10], [11 20], [21 30], [31 40], [41 50], [51 60], [61 70], [71 80], [81 90]};

% Generate and print 5 Tambola tickets
numTickets = 5;

for ticketIndex = 1:numTickets
    % Create an empty Tambola ticket
    tambolaTicket = zeros(3, 9);

    % Fill each column with sorted non-repeating numbers from its range
    for column = 1:9
        range = numberRanges{column};
        availableNumbers = range(1):range(2);

        % Determine the number of blanks for this column (1 or 2)
        numBlanks = randi([1, 2]);

        % Randomly pick non-blank numbers
        nonBlankNumbers = randsample(availableNumbers, 3 - numBlanks);
        
        % Sort the non-blank numbers and place them in ascending order
        tambolaTicket(:, column) = sort([nonBlankNumbers zeros(1, numBlanks)]);

        % Shuffle the sorted non-blank numbers within the column
        tambolaTicket(:, column) = tambolaTicket(randperm(3), column);
    end

    % Display the generated Tambola ticket
    disp(['Tambola Ticket ' num2str(ticketIndex) ':']);
    disp(tambolaTicket);
    disp(' ');
end
