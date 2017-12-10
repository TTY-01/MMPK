clear all
close all

map21 = zeros(21); % map for 10 moves in any direction
mapmemory0 = zeros(21); % map for visited squares
i0 = 11; % row at start
j0 = 11; % column at start
mapmemory0(i0,j0) = 1;
E = zeros(10,1);
E0 = 1;
moveMax = 10;
moveCount = 0;
dirCount = 4;
ENew = 1/4; % 4 colors
EOld = 1/1; % no new information

i1 = 0; j1 = 0; mapmemory1 = zeros(21);
i2 = 0; j2 = 0; mapmemory2 = zeros(21);
i3 = 0; j3 = 0; mapmemory3 = zeros(21);
i4 = 0; j4 = 0; mapmemory4 = zeros(21);
i5 = 0; j5 = 0; mapmemory5 = zeros(21);
i6 = 0; j6 = 0; mapmemory6 = zeros(21);
i7 = 0; j7 = 0; mapmemory7 = zeros(21);
i8 = 0; j8 = 0; mapmemory8 = zeros(21);
i9 = 0; j9 = 0; mapmemory9 = zeros(21);
i10 = 0; j10 = 0; mapmemory10 = zeros(21);

for dir1 = 1:1:4
    mapmemory1 = mapmemory0;
    
    [i1, j1] = move(i0,j0,dir1);
    Edir1 = calculate_expected_value(i1, j1, mapmemory0, E0);
    E(1,1) = E(1,1) + Edir1/dirCount;
    mapmemory1 = set_memory(i1, j1, mapmemory0);
    
    for dir2 = 1:1:4
        mapmemory2 = mapmemory1;
        
        [i2,j2] = move(i1,j1,dir2);
        Edir2 = calculate_expected_value(i2, j2, mapmemory1, Edir1);
        E(2,1) = E(2,1) + Edir2/dirCount^2;
        mapmemory2 = set_memory(i2,j2,mapmemory1);
        
        for dir3 = 1:1:4
            mapmemory3 = mapmemory2;
            
            [i3,j3] = move(i2,j2,dir3);
            Edir3 = calculate_expected_value(i3, j3, mapmemory2, Edir2);
            E(3,1) = E(3,1) + Edir3/dirCount^3;
            mapmemory3 = set_memory(i3,j3,mapmemory2);
            
            for dir4 = 1:1:4
                mapmemory4 = mapmemory3;
            
                [i4,j4] = move(i3,j3,dir4);
                Edir4 = calculate_expected_value(i4, j4, mapmemory3, Edir3);
                E(4,1) = E(4,1) + Edir4/dirCount^4;
                mapmemory4 = set_memory(i4,j4,mapmemory3);
                
                for dir5 = 1:1:4
                    mapmemory5 = mapmemory4;
            
                    [i5,j5] = move(i4,j4,dir5);
                    Edir5 = calculate_expected_value(i5, j5, mapmemory4, Edir4);
                    E(5,1) = E(5,1) + Edir5/dirCount^5;
                    mapmemory5 = set_memory(i5,j5,mapmemory4);
                    
                    for dir6 = 1:1:4
                        mapmemory6 = mapmemory5;
            
                        [i6,j6] = move(i5,j5,dir6);
                        Edir6 = calculate_expected_value(i6, j6, mapmemory5, Edir5);
                        E(6,1) = E(6,1) + Edir6/dirCount^6;
                        mapmemory6 = set_memory(i6,j6,mapmemory5);
                        
                        for dir7 = 1:1:4
                            mapmemory7 = mapmemory6;
            
                            [i7,j7] = move(i6,j6,dir7);
                            Edir7 = calculate_expected_value(i7, j7, mapmemory6, Edir6);
                            E(7,1) = E(7,1) + Edir7/dirCount^7;
                            mapmemory7 = set_memory(i7,j7,mapmemory6);
                            
                            for dir8 = 1:1:4
                                mapmemory8 = mapmemory7;
            
                                [i8,j8] = move(i7,j7,dir8);
                                Edir8 = calculate_expected_value(i8, j8, mapmemory7, Edir7);
                                E(8,1) = E(8,1) + Edir8/dirCount^8;
                                mapmemory8 = set_memory(i8,j8,mapmemory7);
                                
                                for dir9 = 1:1:4
                                    mapmemory9 = mapmemory8;
            
                                    [i9,j9] = move(i8,j8,dir9);
                                    Edir9 = calculate_expected_value(i9, j9, mapmemory8, Edir8);
                                    E(9,1) = E(9,1) + Edir9/dirCount^9;
                                    mapmemory9 = set_memory(i9,j9,mapmemory8);
                                    
                                    for dir10 = 1:1:4
                                        mapmemory10 = mapmemory9;
            
                                        [i10,j10] = move(i9,j9,dir10);
                                        Edir10 = calculate_expected_value(i10, j10, mapmemory9, Edir9);
                                        E(10,1) = E(10,1) + Edir10/dirCount^10;
                                        mapmemory10 = set_memory(i10,j10,mapmemory9);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function [iNew, jNew] = move(i, j, dir)
    iNew = i; jNew = j;
    
    if (dir == 1)
        iNew = move_up(i);
    elseif (dir == 2)
        jNew = move_right(j);
    elseif (dir == 3)
        iNew = move_down(i);
    elseif (dir == 4)
        jNew = move_left(j);
    end
end

function [ iNew ] = move_up(i)
    iNew = i + 1;
end

function [ iNew ] = move_down(i)
    iNew = i - 1;
end

function [ jNew ] = move_right(j)
    jNew = j + 1;
end

function [ jNew ] = move_left(j)
    jNew = j - 1;
end

function [ E ] = calculate_expected_value(i, j, memory, EOld)
    if (check_memory(i, j, memory))
        E = 1/1;
    else
        E = 1/4;
    end
    E = E*EOld;
end

function [isSet] = check_memory(i, j, memory)
    isSet = memory(i,j);
end

function [ memoryNew ] = set_memory(i, j, memoryOld)
    memoryOld(i,j) = 1;
    memoryNew = memoryOld;
end