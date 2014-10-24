clear all
clc

order = 0;
NP = inputdlg({'Name','Phone Number'}, 'Welcome', [1 20;1 9]);
COD = menu ('Carry out or Delivery?', 'Carry out', 'Delivery');
switch COD
    case 1
        COD = 1;
        order=1;
    case 2
        address = inputdlg({'House or Apt Number','Street', 'City'},'What is your address?', [1 10;1 20;1 15]);
        order = 1;
end
SUBTOTAL = 0;
TAX = 0;
while order==1
    ITEM = menu ('What would you like?','Pizza','Sub','Calzone','Side','Drink','DONE');
    switch ITEM
        case 1
            PIZZASIZE = menu ('What size pizza?', 'Small $10.99','Medium $13.99','Large $15.99');
            switch PIZZASIZE
                case 1 
                   SUBTOTAL = SUBTOTAL + 10.99;
                case 2
                   SUBTOTAL = SUBTOTAL + 13.99;
                case 3
                   SUBTOTAL = SUBTOTAL + 15.99;
            end
            PTOP = 1;
            while PTOP ==1
                PTOPM = menu('Pizza Toppings','Chicken $2.99','Pepperoni $2.99','Sausage $2.99','Extra Cheese $1.99','Mushroom $1.99','Onion $.99','Bell Pepper $.99','Olive $.99','DONE');
                if PTOPM ==9;
                    PTOP = 0;
                elseif  PTOPM >=1 && PTOPM <=3
                   SUBTOTAL = SUBTOTAL + 2.99;
                elseif PTOPM >=4 && PTOPM <=5
                   SUBTOTAL = SUBTOTAL + 1.99;
                else
                   SUBTOTAL = SUBTOTAL + .99;
                end
            end
           order = 1; 
        case 2
            SANSIZE = menu ('What size sub?','6 inches $1.99','12 inches $3.59');
            switch SANSIZE
                case 1
                  SUBTOTAL =  SUBTOTAL + 3;
                case 2
                  SUBTOTAL =  SUBTOTAL + 5;
            end
            SANTYPE = menu ('What kind?', 'Turkey $.99','Ham $.99','Roast Beef $1.49');
            switch SANTYPE
                case 1
                  SUBTOTAL =  SUBTOTAL + .99;
                case 2
                   SUBTOTAL = SUBTOTAL + .99;
                case 3
                   SUBTOTAL = SUBTOTAL + 1.49;
            end
            s=1;
            while s==1;
            SANTOP = menu ('What toppings','Cheese','Lettuce','Tomato','Bell peppers','Onion','DONE');
                if SANTOP==6;
                    s=0;
                else
                    s=1;
                end
            end
            order = 1;
        case 3
            CALTYPE = menu ('What type?','Meat Lovers $7.99','Vegetarian $7.49','Cheese $6.99');
            switch CALTYPE
                case 1
                   SUBTOTAL =  SUBTOTAL + 7.99;
                case 2
                   SUBTOTAL = SUBTOTAL + 7.49;
                case 3
                   SUBTOTAL = SUBTOTAL + 6.99;
            end
            order= 1;
        case 4
            SIDETYPE = menu ('What side?','Breadsticks $.99 each','Wings $.99 each','Chips $1.49 each','Cookies $.99 each','DONE');
            switch SIDETYPE
                case 1
                    BRDCOUNT = inputdlg ({'How many?'},'Breadsticks', [1 3]);
                    BRDNUM = str2num (BRDCOUNT{1});
                    SUBTOTAL = SUBTOTAL + (BRDNUM * .99) ;
                case 2
                    WINGCOUNT = inputdlg ({'How many?'},'Wings', [1 3]);
                    WINGSAUCE = menu ('Sauce?','Mild','Hot','Ranch');
                    WINGNUM = str2num (WINGCOUNT{1});
                     SUBTOTAL = SUBTOTAL + (WINGNUM * .99);
                case 3
                    CHIPTYPE = menu ('What type?','Regular','Cheddar','Salt and Vinegar');
                    SUBTOTAL = SUBTOTAL + 1.49;
                case 4
                    COOKCOUNT = inputdlg ({'How many?'},'Cookies', [1 3]);
                    COOKNUM = str2num (COOKCOUNT{1});
                    SUBTOTAL = SUBTOTAL + (COOKNUM * .99);
                    COOKTYPE = menu ('What type?','Chocolate Chip','Sugar','M&M');
                case 5
                    order = 1;
            end
            order = 1;
        case 5
            DRINKTYPE = menu ('What type?','Pepsi','Diet Pepsi','Mountain Dew','Sierra Mist','Lemonade','Root beer','Iced tea','Water');
            if DRINKTYPE == 8;
                DRINKSIZE = menu ('What size?','Small','Medium','Large');
                order = 1;
            else
                DRINKSIZE = menu ('What size?','Small $1.49','Medium $1.79','Large $1.99');
                switch DRINKSIZE
                    case 1
                        SUBTOTAL = SUBTOTAL + 1.49;
                    case 2
                        SUBTOTAL = SUBTOTAL + 1.79;
                    case 3
                        SUBTOTAL = SUBTOTAL + 1.99;
                end
            end
                order = 1;
        case 6
            disp ('Your Subtotal is')
            disp (SUBTOTAL)
            disp ('Your tax is')
            TAX = .06 * SUBTOTAL;
            disp (TAX)
            disp ('Your total is')
            disp (SUBTOTAL + TAX)
            order = 0;
    end
end

AGAIN = menu ('Is this correct?','Yes','No');
switch AGAIN
        case 1
            disp ('Thank you, have a great day!')
        case 2
            disp ('Please order again')
            SUBTOTAL = 0;
            TAX = 0;
            order = 1;
end
