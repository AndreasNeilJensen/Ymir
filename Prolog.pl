% Made using: Gnu-Prolog
% Written by Andreas Neil Jensen, all rights reserved.

% Start of fact declaration %

% airport(AirportName, IATACode, City, Country, Weather).
airport('Koebenhavns lufthavn', 'KL9', 'CPH', 'DEN', 'Cloudy').
airport('London Heathrow Airport', 'LHA3', 'LON', 'ENG', 'Clear').
airport('Moskva-Sjeremetevo Internationale Lufthavn', 'MSIL3', 'MOS', 'RUS', 'Stormy').
airport('Los Angeles International Airport', 'LAIA', 'LA', 'USA', 'Thunderstorm').
airport('Fort Smith Regional Airport', 'SMITH', 'AR', 'USA', 'Clear').
airport('Frankfurt Airport', 'FA7', 'FRF', 'GER', 'Clear').

% aircraft(AircraftCode, AircraftModel, AircraftManufacturer, AircraftClass)
aircraft('OY_JJO', 'Airbus A380', 'Airbus', 'Heavy').
aircraft('TY_KKE', 'Airbus A380', 'Airbus', 'Heavy').
aircraft('LY_TYK', 'Airbus A380', 'Airbus', 'Heavy').
aircraft('YY_PPP', 'Airbus A380', 'Airbus', 'Heavy').
aircraft('YG_HDY', 'Cessna 172', 'Cessna', 'Light').
aircraft('XS_QJQ', 'Cessna 172', 'Cessna', 'Light').
aircraft('LE_HDY', 'Cessna 172E', 'Cessna', 'Light').
aircraft('XP_PJQ', 'Cessna 172', 'Cessna', 'Light').
aircraft('GG_KDY', 'Cessna 172K', 'Cessna', 'Light').
aircraft('LM_QJQ', 'Cessna 172K', 'Cessna', 'Light').

% seat(SeatCode, Seat, SeatPosition, SeatClass, Extras)
seat('1_A_b', '1', 'A', 'business', 'window').
seat('1_B_b', '1', 'B', 'business', 'other').
seat('2_A_b', '2', 'A', 'business', 'other').
seat('2_B_b', '2', 'B', 'business', 'other').
seat('3_A_b', '3', 'A', 'business', 'window').
seat('3_B_b', '3', 'B', 'business', 'other').
seat('4_A_b', '4', 'A', 'business', 'other').
seat('4_B_b', '4', 'B', 'business', 'other').
seat('5_A_b', '5', 'A', 'business', 'window').
seat('5_B_b', '5', 'B', 'business', 'other').

seat('1_A_e', '1', 'A', 'economy', 'window').
seat('1_B_e', '1', 'B', 'economy', 'other').
seat('2_A_e', '2', 'A', 'economy', 'other').
seat('2_B_e', '2', 'B', 'economy', 'other').
seat('3_A_e', '3', 'A', 'economy', 'window').
seat('3_B_e', '3', 'B', 'economy', 'other').
seat('4_A_e', '4', 'A', 'economy', 'other').
seat('4_B_e', '4', 'B', 'economy', 'other').
seat('5_A_e', '5', 'A', 'economy', 'window').
seat('5_B_e', '5', 'B', 'economy', 'other').

% blacklist(Country, BlacklistedCountry)
blacklist('DEN', 'RUS').
blacklist('GER', 'RUS').
blacklist('ENG', 'RUS').

% visa(X, Y)
visa('DEN', 'ENG').
visa('DEN', 'USA').
visa('GER', 'ENG').
visa('GER', 'USA').
visa('ENG', 'GER').
visa('ENG', 'USA').
visa('USA', 'RUS').

% passenger(FirstName, LastName, BirthDay, BirthMonth, BirthYear)
passenger('Andreas', 'Jensen', 06, 07, 1993).
passenger('Vladimir', 'Putin', 06, 07, 1993).
passenger('Robin', 'Hood', 06, 07, 1993).
passenger('Martin', 'Luther', 10, 11, 1483).

% passport(FirstName, LastName, PassportCountry)
passport('Andreas', 'Jensen', 'DEN').
passport('X', 'X', 'DEN').
passport('X', 'X', 'RUS').
passport('Steffen', 'Kalmayer', 'DEN').
passport('Steffen', 'Thorsager', 'DEN').
passport('Peter', 'Printz', 'DEN').
passport('Julie', 'Brogaard', 'DEN').
passport('Vladimir', 'Putin', 'RUS').
passport('Robin', 'Hood', 'ENG').
passport('Martin', 'Luther', 'GER').

% route(RouteCode, AircraftCode, AirlineName, IATACodeFrom, IATACodeTo)
route('1UH', 'OY_JJO', 'Delta Airlines', 'KL9', 'LHA3').
route('2AK', 'XS_QJQ', 'Delta Airlines', 'LHA3', 'KL9').
route('3PO', 'LY_TYK', 'SWISS Airlines', 'MSIL3', 'FA7').
route('4QT', 'GG_KDY', 'SWISS Airlines', 'FA7', 'MSIL3').
route('5PT', 'TY_KKE', 'SAS', 'MSIL3', 'KL9').
route('6KJ', 'XP_PJQ', 'SAS', 'KL9', 'MSIL3').
route('7AK', 'YY_PPP', 'Imaginary Airlines', 'SMITH', 'LAIA').
route('8AA', 'YG_HDY', 'Imaginary Airlines', 'LAIA', 'SMITH').
route('9PT', 'YG_HDY', 'Imaginary Airlines', 'KL9', 'LAIA').


% reservation(ReservationCode, FirstName, LastName, SeatCode, TimeStamp, RouteCode)
reservation('85DD6', 'Andreas', 'Jensen', '3_A_b', '28.10.2009', '1UH'). % this trip is fine
reservation('77KD6', 'Martin', 'Luther', '3_B_b', '28.10.2009', '1UH').  % this trip is fine

reservation('45AL3', 'Vladimir', 'Putin', '1_A_b', '01.05.2019', '2AK'). % this trip is double booked
reservation('25AR4', 'Robin', 'Hood', '1_A_b', '01.05.2019', '2AK').     % this trip is double booked

reservation('72PP6', 'Steffen', 'Kalmayer', '3_B_b', '28.10.2009', '3PO'). % this trip involves russia, which is blacklisted
reservation('97SD6', 'Steffen', 'Thorsager', '2_A_b', '28.10.2009', '3PO'). % this trip involves russia, which is blacklisted
reservation('37FD6', 'Peter', 'Printz', '4_B_b', '28.10.2009', '3PO'). % this trip involves russia, which is blacklisted

reservation('99KD6', 'Julie', 'Brogaard', '5_A_b', '28.10.2009', '4QT'). % this trip involves russia, which is blacklisted
reservation('72UU6', 'Martin', 'Luther', '3_A_b', '28.10.2009', '4QT'). % this trip involves russia, which is blacklisted

reservation('98AF9', 'Andreas', 'Jensen', '2_B_b', '04.09.2029', '5PT').  % this trip involves russia, which is blacklisted

% End of fact declaration %

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 3                                                                                                                            %
% test: accessible_airports_for_passenger('Andreas', 'Jensen').                                                                         %
%       accessible_airports_for_passenger('Vladimir', 'Putin').                                                                         %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

accessible_airports_for_passenger(FirstName, LastName) :-
    airport(AirportName, _, _, DestinationCountry, _),
    passport(FirstName, LastName, PassportCountry),
    (does_first_and_second_have_visa(DestinationCountry, PassportCountry) ; DestinationCountry == PassportCountry),
    write(AirportName).

    does_first_and_second_have_visa(X, Y) :-
        visa(X, Y);
        visa(Y, X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 4                                                                                                                            %
% test: get_illegal_reservations.                                                                                                       %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_illegal_reservations :-
    reservation(_, FirstName, LastName, _, _, RouteCode),
    route(RouteCode, _, _, IATACodeFrom, IATACodeTo),
    get_country_from_IATA(IATACodeTo, CountryTo),
    get_country_from_IATA(IATACodeFrom, CountryFrom),
    passport(FirstName, LastName, PassportCountry),

    has_first_blacklisted_second(CountryTo, PassportCountry),
    format('~w ~w, traveling from ~w to ~w along route ~w is using an illgal reservation to do so.', [FirstName, LastName, CountryFrom, CountryTo, RouteCode]).

    has_first_blacklisted_second(Country, BlacklistedCountry) :-
        blacklist(Country, BlacklistedCountry).

    get_country_from_IATA(IATA, Country) :-
        airport(_, IATA, _, Country, _).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 5                                                                                                                            %
% test: get_double_bookings.                                                                                                            %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_double_bookings :-
    compare_two_reservations(First_ReservationCode, Second_ReservationCode),
    format('Reservation ~w and ~w, are double booked with each other.', [First_ReservationCode, Second_ReservationCode]).

    compare_two_reservations(X,Y) :-
        reservation(X, First_FirstName, First_LastName, SeatCode, TimeStamp, RouteCode),
        reservation(Y, Second_FirstName, Second_LastName, SeatCode, TimeStamp, RouteCode),
        First_FirstName \== Second_FirstName,
        X @> Y, % I have used Term-Ordering to ensure that each result is a special little snowflake.
        First_LastName \== Second_LastName.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 6                                                                                                                            %
% test: get_ready_for_takeoff.                                                                                                          %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_ready_for_takeoff :-
    route(RouteCode, AircraftCode, _, IATACodeFrom, IATACodeTo),
    get_country_from_IATA(IATACodeFrom, CountryFrom),
    get_country_from_IATA(IATACodeTo, CountryTo),

    \+confirm_double_booking_status(RouteCode),
    confirm_weather_status(AircraftCode, IATACodeFrom, IATACodeTo),
    \+confirm_passenger_legality_status(RouteCode, CountryFrom, CountryTo),
    confirm_flight_legality_status(CountryFrom, CountryTo),

    format('Aircraft ~w, from ~w to ~w via route ~w, is cleared for takeoff\n', [AircraftCode, CountryFrom, CountryTo, RouteCode]).

    confirm_double_booking_status(RouteCode) :-
        reservation(First_ReservationCode, _, _, _, _, RouteCode),
        reservation(Second_ReservationCode, _, _, _, _, RouteCode),
        First_ReservationCode @> Second_ReservationCode,
        compare_two_reservations(First_ReservationCode, Second_ReservationCode). 

    confirm_weather_status(AircraftCode, IATACodeFrom, IATACodeTo) :-
        aircraft(AircraftCode, _, _, AircraftClass),
        airport(_, IATACodeFrom, _, _, WeatherFrom),
        airport(_, IATACodeTo, _, _, WeatherTo),
        weather_requirements(AircraftClass, WeatherFrom),
        weather_requirements(AircraftClass, WeatherTo).

        weather_requirements('Heavy', Weather) :- 
            Weather \== 'Thunderstorm'.
        weather_requirements('Light', Weather) :- 
            Weather == 'Clear';
            Weather == 'Cloudy'.

    confirm_passenger_legality_status(RouteCode, CountryFrom, CountryTo) :-
        reservation(_, FirstName, LastName, _, _, RouteCode),
        passport(FirstName, LastName, PassportCountry),
        has_first_blacklisted_second(CountryTo, PassportCountry).


    confirm_flight_legality_status(CountryFrom, CountryTo) :-
        does_first_and_second_have_visa(CountryFrom, CountryTo).
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 7                                                                                                                            %
% test: get_closed_airports.                                                                                                            %
%                                                                                                                                       %
% I had doubts as to the scope of which you wanted us to check the weather at airports in question, so I kept the scope as wide as      %
% I thought reasonable, by checking both the weather at incomming airplanes' origin-airport, as well as departing airplanes'            % 
% destination airports.                                                                                                                 %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

get_closed_airports :-
    airport(AirportName, IATACode, _, _, Weather),
    \+evaluate_routes(IATACode, Weather),
    format('Airport: ~w is closed for today.\n', [AirportName]).

    evaluate_routes(IATACodeInQuestion, Weather) :- 
        % Testing to see if there are routes open from the IATACodeInQuestion and whether or not those routes are allowed to land at ToIATACode.
        (route(_, LeavingAircraftCode, _, IATACodeInQuestion, ToIATACode), 
        airport(_, ToIATACode, _, _, ToWeather), % this step can be skipped to minimize the scope of weather checking.
        aircraft(LeavingAircraftCode, _, _, LeavingAircraftClass),
        weather_requirements(LeavingAircraftClass, Weather),
        weather_requirements(LeavingAircraftClass, ToWeather)); % this step can be skipped to minimize the scope of weather checking.

        % Testing to see if there are routes open from the FromIATACode with the destination IATACodeInQuestion.
        (route(_, ArrivingAircraftCode, _, FromIATACode, IATACodeInQuestion),
        airport(_, FromIATACode, _, _, FromWeather), % this step can be skipped to minimize the scope of weather checking.       
        aircraft(ArrivingAircraftCode, _, _, ArrivingAircraftClass),
        weather_requirements(ArrivingAircraftClass, FromWeather), % this step can be skipped to minimize the scope of weather checking.
        weather_requirements(ArrivingAircraftClass, Weather)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 8                                                                                                                            %
% test: can_X_travel_from_Y_to_Z('Andreas', 'Jensen', 'KL9', 'SMITH').                                                                  %
%       can_X_travel_from_Y_to_Z('Vladimir', 'Putin', 'KL9', 'SMITH').                                                                  %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

can_X_travel_from_Y_to_Z(FirstName, LastName, IATACodeFrom, IATACodeTo) :-
    explore_route_tree(FirstName, LastName, IATACodeFrom, IATACodeTo, []),
    format('~w ~w, is indeed able to travel from ~w to ~w', [FirstName, LastName, IATACodeFrom, IATACodeTo]).

    explore_route_tree(FirstName, LastName, IATACodeFrom, IATACodeTo, PreviouslyVisitedNodes) :-
        route(RouteCode, AircraftCode, _, IATACodeFrom, IATACodeTo), % Is there a direct route from X to Y?
        are_there_free_seats(RouteCode),
        \+is_this_passenger_blacklisted(FirstName, LastName, IATACodeFrom, IATACodeTo); 

        route(RouteCodeHypothetical, AircraftCode, _, IATACodeFrom, IATACodeToHypothetical), % Come up with a new route from X to Z.
        confirm_no_match(RouteCodeHypothetical, PreviouslyVisitedNodes), % Make sure that route is not already computed in previous itterations.
        append([RouteCodeHypothetical], PreviouslyVisitedNodes, Result), % Very well then, add this new route to the list of already visited nodes.
        \+is_this_passenger_blacklisted(FirstName, LastName, IATACodeFrom, IATACodeTo),
        are_there_free_seats(RouteCodeHypothetical),
        explore_route_tree(FirstName, LastName, IATACodeToHypothetical, IATACodeTo, Result). % Run explore_route_tree again, this time on X to Z with the new list.

    is_this_passenger_blacklisted(FirstName, LastName, IATACodeFrom, IATACodeTo) :-
        get_country_from_IATA(IATACodeFrom, CountryFrom),
        get_country_from_IATA(IATACodeTo, CountryTo),
        passport(FirstName, LastName, PassportCountry),
        (has_first_blacklisted_second(CountryFrom, PassportCountry);
        has_first_blacklisted_second(CountryTo, PassportCountry)). % There are definitely some redundancy issues here which could be solved by someone more patient than me, but meh...
    
    are_there_free_seats(RouteCode) :-
        route(RouteCode, AircraftCode, AirlineName, IATACodeFrom, IATACodeTo),
        seat(SeatCode, _, _, _, _),
        \+reservation(ReservationCode, _, _, SeatCode, _, RouteCode).

    confirm_no_match(RouteCode, []) :-
        true. %Yaaaaay confirm_no_match has traversed the entire list without finding a match! :D
    confirm_no_match(RouteCode, [RouteCodeHead|RouteCodeTail]) :-
        RouteCode \== RouteCodeHead,
        confirm_no_match(RouteCode, RouteCodeTail).
        
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem: 9                                                                                                                            %
% test: accessible_airports_for_passenger_V2('Andreas', 'Jensen').                                                                      %
%       accessible_airports_for_passenger_V2('Vladimir', 'Putin').                                                                      %
%                                                                                                                                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%A dual citizen is a person with citizenship in at least two countries.
%A state may decide to enforce a blacklist which prohibits the citizens of some
%countries from entering their country, regardless of what other citizenship(s)
%the person(s) may hold.

%Compute the airports a passenger may fly into taking dual citizenship and
%blacklists into account.

accessible_airports_for_passenger_V2(FirstName, LastName) :-
    airport(AirportName, _, _, AirportCountry, _),
    \+is_there_blacklist_instance(AirportCountry, FirstName, LastName),
    write(AirportName).

    is_there_blacklist_instance(AirportCountry, FirstName, LastName) :-
        passport(FirstName, LastName, PassportCountry),
        has_first_blacklisted_second(AirportCountry, PassportCountry).