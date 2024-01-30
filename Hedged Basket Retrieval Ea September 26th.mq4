
//////////////////////////*-*-*-*You Can Control From This Settings*-*-*-*////////////////////////////////////////
                                                                                                                //
bool Use_Limitation_Date=false;          // If you put true here the parameter will work .                      //                   
datetime End_Time=D'2023.10.30 00:00';   //  <------(Year.Month.Day/HH:MM       Time whene you need stop the EA .                    //

bool Use_Limitation_Account_Number=false;     // If you put true here the parameter will work .            //
int Account_Number=18649686;         //  <------       The Account Number Where you run The EA .                                                                                             //
                                                                                                       //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////*-*-*-*You Can Control From This Settings*-*-*-*/////////////////////////////////////////
#property copyright "toddwootton@live.com"//  Put you email Here !  "KK@gmail.com"  and compile 
#property link      "https://www.mql5.com"
#property version   ""
#property strict 

input string EaName=" Hedged Basket Retreival EA ";
enum Trading {Long_And_Short,Long_Only,Short_Only};
extern Trading Trading_Mode=Long_And_Short;
extern int magic=21212121;// Magic Number :
extern int magic2=21212122; // Hedge Magic Number
extern double MaxSpread=10;// Spread Limit(Pip) : 
extern int MAX_Open_Trade=100;//Max Trades In One Direction:

extern string info1="************ Entry Filters ************";/////////////////////////////// :

extern string info2="************ Moving Average 1 Filter(faster) ************";/////////////////////////////// :
extern bool Use_Ma1_Entry=false;// Use Ma 1 Entry(false->without indicator)
extern int MAPeriod1=100;// MA 1 Entry Period :
extern ENUM_TIMEFRAMES MATf1=PERIOD_CURRENT; // MA 1 Entry Timeframe :
extern ENUM_MA_METHOD MAMethod1 = MODE_SMA; // MA 1 Method : 
extern ENUM_APPLIED_PRICE MAPrice1 = PRICE_CLOSE; // MA1 Applied Price :
extern int MinimumDelta = 10; // Minimum Delta(Points)

extern string info3="************ Moving Average 2 Filter(slower) ************";/////////////////////////////// :
extern bool Use_Ma2_Entry=false;// Use Ma 2 Entry(false->without indicator)
extern int MAPeriod2=200;// MA 2 Entry Period :
extern ENUM_TIMEFRAMES MATf2=PERIOD_CURRENT; // MA 2 Entry Timeframe :
extern ENUM_MA_METHOD MAMethod2 = MODE_SMA; // MA 2 Method : 
extern ENUM_APPLIED_PRICE MAPrice2 = PRICE_CLOSE; // MA2 Applied Price :

extern string info4="************ RSI Filter ************";/////////////////////////////// :
extern bool UseRSI = false; // Use RSI Entry(false->without indicator)
extern int RSIPeriod = 14; // RSI Period :
extern double RSIHigh = 70; // RSI High Level :
extern double RSILow = 30; // RSI Low Level :
extern ENUM_APPLIED_PRICE RSIPrice = PRICE_CLOSE; // RSI Applied Price:

extern string info5="************ ADX Filter ************";/////////////////////////////// :
extern bool UseADX = false; // Use ADX Entry(false->without indicator)
extern int ADXPeriod = 14; // ADX Period :
extern double HighADXValue = 25; // ADX High Value :
extern ENUM_APPLIED_PRICE ADXPrice = PRICE_CLOSE; // ADX Applied Price :
extern int GuideMAPeriod=200;// Guiding MA Entry Period :
extern ENUM_TIMEFRAMES GuideMATf=PERIOD_CURRENT; // Guiding MA Entry Timeframe :
extern ENUM_MA_METHOD GuideMAMethod = MODE_SMA; // Guiding MA Method : 
extern ENUM_APPLIED_PRICE GuideMAPrice = PRICE_CLOSE; // Guiding MA Applied Price :

extern string info6="************ Bollinger Band Filter ************";/////////////////////////////// :
extern bool UseBollinger = false; // Use Bollinger Filter(false->without indicator)
extern int BolPeriod = 20; // BBand Period :
extern int BolDeviations = 2; // BBand Deviations :
extern ENUM_APPLIED_PRICE BolPrice = PRICE_CLOSE; // BBand Applied Price :


input string M12="************ Gap Levels ************";/////////////////////////////// :
extern int Price_Gap_Size=10;//Gap Level Spacing(Pip):
extern int Start_Level_Gap=1;// Start Level for Price Scaling :
enum Scaling {Percent_Based_Scaling,Pip_Based_Scaling};
extern Scaling Scaling_Type=Percent_Based_Scaling;// Gap Scaling Type :
extern double Scaling_Percent=100.0;// Gap Scaling Percent (100%->Disbale):
extern double Scaling_Pip=0.0;// Gap Scaling Pip (0->Disable):
extern double Min_Gap_Size=6.0;// Minimum Price Gap Size (>=1):
input string Manual_Lot_Size="************ Position Sizing  ************";/////////////////////////////// :
enum A{First_Lot_Fixed,Compounding_Lotsize};
extern A uselot=First_Lot_Fixed; //Use Lot :
extern double Initial_Lotsize=0.01;// Initial Lotsize : 
extern double Compounding=500; // 0.01 per $ :
extern int Start_Level_Lot=1;// Start Level for Lots Changes (>=1):
enum Change {Change_by_Rate,Change_by_Lots};
extern Change Use_Lot=Change_by_Rate;// Type of lot changes[dropdown]
extern double Rate_Change_Phase1=150.0;// Phase 1: Change by Rate[100:Same,>100:UP,<100:Down]
extern double Lot_Change_Phase1=0.0;// Phase 1: Change by Lot[0:Same,>0:UP,<0:Down]
extern double Target_lot1_input=0.0; // Phase 1:Target Lots[0:off]

extern double Rate_Change_Phase2=100.0;// Phase 2: Change by Rate[100:Same,>100:UP,<100:Down]
extern double Lot_Change_Phase2=0.0;// Phase 2: Change by Lot[0:Same,>0:UP,<0:Down]
extern double Target_lot2_input=0.0; // Phase 2:Target Lots[0:off]

extern string M22= "************ CLOSURE ************";///////////////////////////////// :
input int TP=0;// Take Profit Pip(first grid) :
extern double Basket=10;// Basket Close Profit_$ per 0.01 lot (>1):
extern bool ReEntry=true;// Re_Entry Allowed ?
extern double Max_Distance=500;// Max Distance Between Buys/Sells (0->Disable):
extern bool Closure_Level=false;// Use Closure Price Level:
extern bool Close_Losing_Trades_Only=true;//Close_Losing_Trades_Only(true/false=Close All trade) :
extern double Close_Grid_Above=0.0;// Close Grid Above Pips(0->Disable)
extern double Close_Grid_Below=0.0;// Close Grid Below Pips (0->Disable)
extern bool Reopen=true;// Reopen after Hit Level (True/false) :
extern int MAPeriod=100;// MA Period :
extern ENUM_MA_METHOD MAMethod=0;// MA Method
extern ENUM_APPLIED_PRICE Applied_Price=0;//MA Applied Price
extern ENUM_TIMEFRAMES MA_Timeframe=0;//MA TimeFrames
extern string M18="************ Pruning Manager ************";/////////////////////////////////// :
extern bool Use_Pruning=false;//Use_Pruning Method (True/false) :
extern double DrawDown=0.0;// Drawdown % to Start Pruning :
extern int Trade=0;// number of Trade to Start Pruning(0->Disable) : 
extern double Pip_Closure=500;// Pip_Closure closure !
extern int MAPeriodPruning=100;// MA Period :
extern ENUM_MA_METHOD MAMethodPruning=0;// MA Method
extern ENUM_APPLIED_PRICE Applied_PricePruning=0;//MA Applied Price
extern ENUM_TIMEFRAMES MA_TimeframePruning=0;//MA TimeFrames
 string M8="************ Trailing Stop Manager ************";//   parameters  :
 bool UseTrailingStop=false;
 int TrailingStop=10;// Trailing Start after x pips Profit :
 int TrailingStep=10;// Trailing Step :
 
extern string M33= "************ Hedging ************";///////////////////////////////// : 
extern bool UseHedge = false; // Use Hedging
extern double Drawdown = 30; // Start At Drawdown(%)
extern double HedgeFactor = 70; // Hedge Factor(%)
//extern double RemoveHedge = 10; // Hedge Removal(pips)
//extern bool UseHedgeMAFilter = true; // Use Hedge MA Filter
extern int HedgeMA1 = 5; // Hedge Fast MA Period
extern ENUM_TIMEFRAMES HedgeMA1TF = PERIOD_CURRENT; // Hedge Fast MA Timeframe
extern int HedgeMA2 = 10; // Hedge Slow MA Period
extern ENUM_TIMEFRAMES HedgeMA2TF = PERIOD_CURRENT; // Hedge Slow MA Timeframe
extern int HedgeBlackout = 15; // Hedge Blackout(Minutes)
//extern int HedgeMA3 = 15; // Hedge MA3 Period
//extern bool CloseTradeAtMaxOrders = false; // Close Trades At Maximum Orders
 
input string M19="************ Trading time/Day ************";///////////////////////////////// :
extern bool UTT=false;// Use Trading Time (True/false):
extern string StartTrading="00:30";//Start trading HH:MM
extern string EndTrading="23:30";//End trading HH:MM
extern bool UTD=false;// Use Trading Day (True/false):
extern bool TOM=true;// Trade On Monday :
extern bool TOT=true;// Trade On Tuesday :
extern bool TOW=true;// Trade On Wednesday:
extern bool TOTH=true;// Trade On Thursday : 
extern bool TOF=true;// Trade On Friday :

input string M20="************ Other Settings ************";///////////////////////////////// :
extern bool Show_Panel=true;
extern bool Show_BasketSL=true;
extern color Buy_Profit_Color=clrAliceBlue;
extern color Sell_Profit_Color=clrSalmon;
extern bool UseDebug=false; // Print Debug Statements
//+------------------------------------------------------------------+
 int Slippage = 50;
string Buy,Sell;
double MyPoint=(Digits==3 || Digits==5)?10*Point:Point,Buyt,Buys,Sellt,Sells,tp,sl,spread,LOSS;
int Ticket,cnt,Z=-1,Q=-1;
bool zs;
int RS=-1,RB=-1;
int PRB=-1,PRS=-1;
datetime end2,start2,end1,start1; 
double ComLotB=0, ComLotS=0;
//double CGA,CGB;
double SSTART ,BSTART;


bool BLOCKTRADES=false;
datetime STARTTIME = 0;
bool BUYHEDGE=false;
bool SELLHEDGE=false;

struct hedge{
   bool hedging;
   int initialtrades[];
   int baskettrades[];
};

hedge bhedge;
hedge shedge;

double FIRSTLOT=0;
double HIGHWATERMARK=0;
datetime LASTBUYHEDGETIME=0,LASTSELLHEDGETIME=0;

double bmult=1,smult=1;

int BUYPHASE=0;
int SELLPHASE=0;
double FIRSTBUYLOT=0;
double FIRSTSELLLOT=0;


//+------------------------------------------------------------------+
int OnInit()
  {
   STARTTIME=TimeCurrent();
   ButtonCreate(0,"Button Block New Trades",0,120,20,100,30,CORNER_RIGHT_UPPER,"Block New Trades","Arial",8,clrBlack,clrRed);
   
if((Use_Limitation_Date==true&&TimeCurrent()>End_Time)||(Use_Limitation_Account_Number==true&&AccountNumber()!=Account_Number)) return(INIT_FAILED);
   
 
 if(Closure_Level==true){  
  
     HLineCreate("StopAbove",0,Bid+Close_Grid_Above*MyPoint,clrLime,STYLE_SOLID,2,false,true,false,0);              
     HLineCreate("StopBelow",0,Bid-Close_Grid_Above*MyPoint,clrOrangeRed,STYLE_SOLID,2,false,true,false,0);  }
  //CGA=Bid+Close_Grid_Above*MyPoint;
  //CGB=Bid-Close_Grid_Below*MyPoint;  
     return(INIT_SUCCEEDED);


  }

void OnDeinit(const int reason)
{
   DeleteAllObjects("Button");
   ObjectDelete("Buy Basket TP");
   ObjectDelete("Sell Basket TP");
}


//------------------------------
//+------------------------------------------------------------------+
void OnTick()
  {  
   if(FIRSTLOT==0){
      FIRSTLOT=firstlot();
   }
   if(HIGHWATERMARK<AccountEquity()){
      HIGHWATERMARK=AccountEquity();
   }
   if(Show_BasketSL){
      SimulateBasketTPLines();
   }
   else{
      ObjectDelete("Buy Basket TP");
      ObjectDelete("Sell Basket TP");
   }
   
   if(UseHedge){
      ManageHedge();
   }
   
   
   

if(Show_Panel==true) {Panel();}
// Comment(Start_Level_Lot+1+MathCeil(MathAbs(MathLog((Initial_Lotsize-Target_lot1)/Target_lot1)/MathLog(Rate_Change_Phase1/100))));
 spread=NormalizeDouble((Ask-Bid)/MyPoint,1);

if(uselot==Compounding_Lotsize){
    if(TB()<1){ComLotB=firstlot();}
    if(TS()<1){ComLotS=firstlot();}}
//----------------------------------




if(BuyProfit()>=Basket*FIRSTBUYLOT/FIRSTLOT && TB()>1/*&&!BUYHEDGE*/ )
      {TextCreate(0,DoubleToStr(BuyProfit(),2)+TimeToStr(Time[0]),Time[0],High[1]+2*MyPoint,"$ "+DoubleToStr(BuyProfit(),1)+" ",Buy_Profit_Color); CB(); LASTBUYHEDGETIME=0;}  
if(SellProfit()>=Basket*FIRSTSELLLOT/FIRSTLOT && TS()>1/* &&!SELLHEDGE*/)
      {TextCreate(0,DoubleToStr(SellProfit(),2)+TimeToStr(Time[0]),Time[0],Low[1]-2*MyPoint,"$ "+DoubleToStr(SellProfit(),1)+" ",Sell_Profit_Color);CS();LASTSELLHEDGETIME=0;} 

if(Use_Pruning){
if( SymbolProfit()<0 && MathAbs(100*SymbolProfit()/AccountBalance())>DrawDown){
if(/*!BUYHEDGE&&*/TB()>Trade && bigbuyOP()-Bid >Pip_Closure*MyPoint){bool aa=OrderClose(bigbuyticket(),bigbuylot(),Bid,5,clrRed);PRB=1;}  
if(/*!SELLHEDGE&&*/TS()>Trade && Bid-smalsellOP()>Pip_Closure*MyPoint){bool bb=OrderClose(smalsellticket(),smalselllot(),Ask,5,clrGreen);PRS=1;} 
}

if(BuySignalP()&&PRB==1){PRB=-1;}
if(SellSignalP()&&PRS==1){PRS=-1;}

}
//------------------------------------- Modifie Smll Buy && Big Sell :

if(TB()>1){TPBuyModif();}
if(TS()>1){TPSellModif();}
   
//---------------------------------------------------------------
if(Closure_Level==true){
//---------------------------------------------------
    SSTART=ObjectGet("StopBelow",OBJPROP_PRICE1);
    BSTART=ObjectGet("StopAbove",OBJPROP_PRICE1);
   
if(Close_Losing_Trades_Only=false){
if(((Bid>=BSTART && BSTART!=0 )|| (Bid<=SSTART && SSTART!=0))&& lastOrdertime()<Time[0]){CB();CS();if(Reopen){RS=1;RB=1;}}}
if(Close_Losing_Trades_Only=true){
if(Bid>=BSTART && BSTART!=0 && lastOrdertime(OP_SELL)<Time[0]){CS();RS=1;}
if(Bid<=SSTART && SSTART!=0 && lastOrdertime(OP_BUY)<Time[0]){CB();RB=1;}
}
if(Reopen==true){
      if(BuySignal()&&RB==1){RB=0;}
      if(SellSignal()&&RS==1){RS=0;}
}
}
//--------------------------------------- Trailing Stop 
 if(UseTrailingStop==true){
 if(TB()<2){ TSBuy();}}
if(UseTrailingStop==true){ 
 if(TS()<2){ TSSell();}}  

//-------- first buy and sell :    firstlot()

if(spread<=MaxSpread&&checktradingDay()&&checktradingTime()){
 if((Closure_Level==true && (( Bid>SSTART && BSTART!=0)||BSTART==0))||Closure_Level==false){
 if(TB()<1&&(Trading_Mode==Long_And_Short||Trading_Mode==Long_Only)&&(Max_Distance==0 ||(Max_Distance!=0 && (MathAbs(Ask-SmalOpSell())<Max_Distance*MyPoint ||SmalOpSell()==0))))
                           {if((ReEntry==true ||(ReEntry==false &&Z!=1))&&RB!=1)
                           {if(FilterBuy()){ FBUY();Z=1;BUYPHASE=1;}}}}

 if((Closure_Level==true &&(( Bid<BSTART && BSTART!=0)||BSTART==0) )||Closure_Level==false){
 if(TS()<1&&(Trading_Mode==Long_And_Short||Trading_Mode==Short_Only)&&(Max_Distance==0 ||(Max_Distance!=0 && (MathAbs(Bid-BigOpBuy())<Max_Distance*MyPoint||BigOpBuy()==0))))
                           {if((ReEntry==true ||(ReEntry==false &&Q!=1))&&RS!=1)
                           {if(FilterSell()){  FSELL();Q=1;SELLPHASE=1;}}}}
 }
 
//------ Buy/Sell Sequances         
 if((Closure_Level==true && ((Bid<BSTART && BSTART!=0)||BSTART==0)  )||Closure_Level==false){
if(TS()>0&&TS()<MAX_Open_Trade){
            if(SymbolInfoDouble(Symbol(),SYMBOL_BID)>=BigOpSell()+(SellGap()*MyPoint)){if(PRS==-1){SELL();}}} }    

 if((Closure_Level==true && (( Bid>SSTART && BSTART!=0)||BSTART==0))||Closure_Level==false){              
if(TB()>0&&TB()<MAX_Open_Trade){
     if(SymbolInfoDouble(Symbol(),SYMBOL_ASK)<=SmalOpBuy()-(BuyGap()*MyPoint)){if(PRB==-1){BUY();} }} }

     



 }//-------------------------    // END On Tick


//----------------------------------------------------------------------------------Functions

//--------------------------------- GAPS for Buys : 

double BuyGap(){
         double l=Price_Gap_Size;
   if(Scaling_Type==Percent_Based_Scaling){
       if(TB()<Start_Level_Gap) { l=Price_Gap_Size;}
       if(TB()>=Start_Level_Gap){  l=NormalizeDouble(Price_Gap_Size*MathPow(Scaling_Percent/100,TB()-Start_Level_Gap),2);}}
       
   if(Scaling_Type==Pip_Based_Scaling){
       if(TB()<Start_Level_Gap) { l=Price_Gap_Size;}
       if(TB()>=Start_Level_Gap){  l=NormalizeDouble(Price_Gap_Size+((TB()-Start_Level_Gap)*Scaling_Pip),2);}}
              
       
       l=MathMax(l,Min_Gap_Size);
         return (l);}

double SellGap(){
         double l=Price_Gap_Size;
   if(Scaling_Type==Percent_Based_Scaling){
       if(TS()<Start_Level_Gap) { l=Price_Gap_Size;}
       if(TS()>=Start_Level_Gap){  l=NormalizeDouble(Price_Gap_Size*MathPow(Scaling_Percent/100,TS()-Start_Level_Gap),2);}}
       
   if(Scaling_Type==Pip_Based_Scaling){
       if(TS()<Start_Level_Gap) { l=Price_Gap_Size;}
       if(TS()>=Start_Level_Gap){  l=NormalizeDouble(Price_Gap_Size+((TS()-Start_Level_Gap)*Scaling_Pip),2);}}
              
       
       l=MathMax(l,Min_Gap_Size);
         return (l);}
// -----------------------------set lotsize :
double firstlot(){
   double l=Initial_Lotsize;
 if(uselot==First_Lot_Fixed)  {l=Initial_Lotsize;}
 
  if(uselot==Compounding_Lotsize)
  {double profit=(AccountEquity()/Compounding);
  l=NormalizeDouble((profit*0.01),2);
  }
  if(l<MarketInfo(Symbol(),MODE_MINLOT))l=MarketInfo(Symbol(),MODE_MINLOT);
  if(l>MarketInfo(Symbol(),MODE_MAXLOT))l=MarketInfo(Symbol(),MODE_MAXLOT);
  
  return NormalizeDouble(l,2);
}
//----------------------------- 
double LotsizeSell(){
 double L=0;
 if(uselot==First_Lot_Fixed){L=lots();}
 if(uselot==Compounding_Lotsize){L=compoundinglotsell();} 
 return(L);
}  

double LotsizeBuy(){
 double L=0;
 if(uselot==First_Lot_Fixed){L=lotb();}
 if(uselot==Compounding_Lotsize){L=compoundinglotbuy();} 
 return(L);
}  


double lots(){
  double Lot=0;
  double compoundingmultiplier=FIRSTSELLLOT/FIRSTLOT;
  double Target_lot1=Target_lot1_input*compoundingmultiplier;
  double Target_lot2=Target_lot2_input*compoundingmultiplier;
  
 if(Use_Lot==Change_by_Lots){
 
  if(TS()<Start_Level_Lot){Lot =Initial_Lotsize;}
  if(TS()>=Start_Level_Lot){   // Phase Lotsize ( Add )
            if(Lot_Change_Phase1==0) {Lot=Initial_Lotsize;}
            if(Lot_Change_Phase1>0 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1;}
                           if(Target_lot1 >0) {
                              if(TS()<Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))
                                 {
                                  if( lastOrderInfo("Lots",OP_SELL)<Target_lot1 && Target_lot1>0)
                                        {Lot=MathMin(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1,Target_lot1);}}
                                        
                                        
            if(TS()>=Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))   // Phase 2 
                { 
                if( Lot_Change_Phase2==0) { Lot=Target_lot1;}
                if( Lot_Change_Phase2>0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMin(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);} }
                if( Lot_Change_Phase2<0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMax(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);} }                                      
                 }   /* End Phase 2 :*/  }  // End target Lot >0
                           
            } // End Clot1 >0 : 
            
            if(Lot_Change_Phase1<0 ) {     // CLOT >0
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1;}
                           if(Target_lot1 >0) {   
                              if(TS()<Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))
                                 {
                                  if( lastOrderInfo("Lots",OP_SELL)>Target_lot1 && Target_lot1>0)
                                        {Lot=MathMax(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1,Target_lot1);}}
                                        
                                        
            if(TS()>=Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))   // Phase 2 
                { 
                if( Lot_Change_Phase2==0) { Lot=Target_lot1;}
                if( Lot_Change_Phase2>0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMin(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);} }
                if( Lot_Change_Phase2<0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMax(lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);} }                                      
                 }   /* End Phase 2 :*/  }  // End target Lot >0
                           
            } // End Clot1 >0 : 
   
    }
    } // End change by lot :
 
//----------------------- CHANGE BY RATE //// !!!!!! START 

 if(Use_Lot==Change_by_Rate){
 
  if(TS()<Start_Level_Lot){Lot =Initial_Lotsize;}
  if(TS()>=Start_Level_Lot){   // Phase Lotsize ( Add )
            if(Rate_Change_Phase1==100) {Lot=Initial_Lotsize;}
            if(Rate_Change_Phase1>100 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100;}
                           if(Target_lot1 >0) {
                              if(TS()<Start_Level_Lot+MathCeil(MathLog((Target_lot1)/Initial_Lotsize)/MathLog(Rate_Change_Phase1/100)))   // FOR REVIEW ::
                                 {  if( lastOrderInfo("Lots",OP_SELL)<Target_lot1 && Target_lot1>0)  
                                             {Lot=MathMin(lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100,Target_lot1);}}
                                        
                                        
                              if(TS()>=Start_Level_Lot+MathCeil(MathLog((Target_lot1)/Initial_Lotsize)/MathLog(Rate_Change_Phase1/100)))   // Phase 2   // FOR REVIEW :
                                  { 
                                  if( Rate_Change_Phase2==100) { Lot=Target_lot1;}
                                  if( Rate_Change_Phase2>100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMin( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);} }
                                  if( Rate_Change_Phase2<100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMax( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);} }                                      
                                   }   /* End Phase 2 :*/  }  // End target Lot >0
                           
                             } // End Clot1 >0 : 
                             

            if(Rate_Change_Phase1<100 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100;}
                           if(Target_lot1 >0) {
                              if(TS()<Start_Level_Lot+MathCeil(MathAbs(MathLog((Initial_Lotsize-Target_lot1)/Target_lot1)/MathLog(Rate_Change_Phase1/100))))   // FOR REVIEW ::
                                 {  if( lastOrderInfo("Lots",OP_SELL)>Target_lot1 && Target_lot1>0)  
                                             {Lot=MathMax(lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100,Target_lot1);}}
                                              
                              if(TS()>=Start_Level_Lot+MathCeil(MathAbs(MathLog((Initial_Lotsize-Target_lot1)/Target_lot1)/MathLog(Rate_Change_Phase1/100))))    // Phase 2   // FOR REVIEW :
                                  { 
                                  if( Rate_Change_Phase2==100) { Lot=Target_lot1;}
                                  if( Rate_Change_Phase2>100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMin( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);} }
                                  if( Rate_Change_Phase2<100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMax( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);} }                                      
                                   }   /* End Phase 2 :*/  }  // End target Lot >0
                           
                             } // End Clot1 >0 :            

   
    }
    } // End change by RATE  :

   if(Lot<MarketInfo(Symbol(),MODE_MINLOT))Lot=MarketInfo(Symbol(),MODE_MINLOT);
   if(Lot>MarketInfo(Symbol(),MODE_MAXLOT))Lot=MarketInfo(Symbol(),MODE_MAXLOT);
  return(NormalizeDouble(Lot,2));

  }
//-----------------------------   
double lotb(){
  double Lot=0;
  double compoundingmultiplier=FIRSTBUYLOT/FIRSTLOT;
  double Target_lot1=Target_lot1_input*compoundingmultiplier;
  double Target_lot2=Target_lot2_input*compoundingmultiplier;
  
 if(Use_Lot==Change_by_Lots){
 
  if(TB()<Start_Level_Lot){Lot =Initial_Lotsize;}
  if(TB()>=Start_Level_Lot){   // Phase Lotsize ( Add )
            if(Lot_Change_Phase1==0) {Lot=Initial_Lotsize;}
            if(Lot_Change_Phase1>0 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1;}
                           if(Target_lot1 >0) {
                              if(TB()<Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))
                                 {
                                  if( lastOrderInfo("Lots",OP_BUY)<Target_lot1 && Target_lot1>0)
                                        {Lot=MathMin(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1,Target_lot1);}}
                                        
                                        
            if(TB()>=Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))   // Phase 2 
                { 
                if( Lot_Change_Phase2==0) { Lot=Target_lot1;}
                if( Lot_Change_Phase2>0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMin(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);} }
                if( Lot_Change_Phase2<0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMax(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);} }                                      
                 }   /* End Phase 2 :*/  }  // End target Lot >0
                           
            } // End Clot1 >0 : 
            
            if(Lot_Change_Phase1<0 ) {     // CLOT >0
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1;}
                           if(Target_lot1 >0) {   
                              if(TB()<Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))
                                 {
                                  if( lastOrderInfo("Lots",OP_BUY)>Target_lot1 && Target_lot1>0)
                                        {Lot=MathMax(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1,Target_lot1);}}
                                        
                                        
            if(TB()>=Start_Level_Lot+MathCeil((Target_lot1-(Start_Level_Lot*Initial_Lotsize))/Lot_Change_Phase1 ))   // Phase 2 
                { 
                if( Lot_Change_Phase2==0) { Lot=Target_lot1;}
                if( Lot_Change_Phase2>0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMin(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);} }
                if( Lot_Change_Phase2<0 ) {
                                if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2; } 
                                if(Target_lot2 >0) { Lot=MathMax(lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);} }                                      
                 }   /* End Phase 2 :*/  }  // End target Lot >0
                           
            } // End Clot1 >0 : 
   
    }
    } // End change by lot :
 
//----------------------- CHANGE BY RATE //// !!!!!! START 

 if(Use_Lot==Change_by_Rate){
 
  if(TB()<Start_Level_Lot){Lot =Initial_Lotsize;}
  if(TB()>=Start_Level_Lot){   // Phase Lotsize ( Add )
            if(Rate_Change_Phase1==100) {Lot=Initial_Lotsize;}
            if(Rate_Change_Phase1>100 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100;}
                           if(Target_lot1 >0) {
                              if(TB()<Start_Level_Lot+MathCeil(MathLog((Target_lot1)/Initial_Lotsize)/MathLog(Rate_Change_Phase1/100)))   // FOR REVIEW ::
                                 {  if( lastOrderInfo("Lots",OP_BUY)<Target_lot1 && Target_lot1>0)  
                                             {Lot=MathMin(lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100,Target_lot1);}}
                                        
                                        
                              if(TB()>=Start_Level_Lot+MathCeil(MathLog((Target_lot1)/Initial_Lotsize)/MathLog(Rate_Change_Phase1/100)))   // Phase 2   // FOR REVIEW :
                                  { 
                                  if( Rate_Change_Phase2==100) { Lot=Target_lot1;}
                                  if( Rate_Change_Phase2>100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMin( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);} }
                                  if( Rate_Change_Phase2<100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMax( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);} }                                      
                                   }   /* End Phase 2 :*/  }  // End target Lot >0
                           
                             } // End Clot1 >0 : 
                             

            if(Rate_Change_Phase1<100 ) {
                           if(Target_lot1==0) {Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100;}
                           if(Target_lot1 >0) {
                              if(TB()<Start_Level_Lot+MathCeil(MathAbs(MathLog((Initial_Lotsize-Target_lot1)/Target_lot1)/MathLog(Rate_Change_Phase1/100))))   // FOR REVIEW ::
                                 {  if( lastOrderInfo("Lots",OP_BUY)>Target_lot1 && Target_lot1>0)  
                                             {Lot=MathMax(lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100,Target_lot1);}}
                                              
                              if(TB()>=Start_Level_Lot+MathCeil(MathAbs(MathLog((Initial_Lotsize-Target_lot1)/Target_lot1)/MathLog(Rate_Change_Phase1/100))))    // Phase 2   // FOR REVIEW :
                                  { 
                                  if( Rate_Change_Phase2==100) { Lot=Target_lot1;}
                                  if( Rate_Change_Phase2>100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMin( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);} }
                                  if( Rate_Change_Phase2<100 ) {
                                                  if(Target_lot2==0) { Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; } 
                                                  if(Target_lot2 >0) { Lot=MathMax( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);} }                                      
                                   }   /* End Phase 2 :*/  }  // End target Lot >0
                           
                             } // End Clot1 >0 :            

   
    }
    } // End change by RATE  :

   if(Lot<MarketInfo(Symbol(),MODE_MINLOT))Lot=MarketInfo(Symbol(),MODE_MINLOT);
   if(Lot>MarketInfo(Symbol(),MODE_MAXLOT))Lot=MarketInfo(Symbol(),MODE_MAXLOT);
  return(NormalizeDouble(Lot,2));

  }
//------------------------------
// --------------------- Sell Buy Orders Function :
void SELL()
  {  
   if(BLOCKTRADES/*||SELLHEDGE*/){
      return;
   }
   int sell=OrderSend(Symbol(),OP_SELL,LotsizeSell(),Bid,50,0,0,EaName,magic,0,clrRed);
   if(sell<0)
     {
      Print("sell failed with error #",GetLastError());
     }
   else
     {
      Debug("csell placed successfully");
     }
  }
////////////////////////////////////////

void BUY()
  {                          
   if(BLOCKTRADES/*||BUYHEDGE*/){
      return;
   }
   int buy=OrderSend(Symbol(),OP_BUY,LotsizeBuy(),Ask,50,0,0,EaName,magic,0,clrBlue);
   if(buy<0)
     {
      Print("buy failed with error #",GetLastError());
     }
   else
     {
      Debug("cbuy placed successfully");
     }
  }
 

// --------------------- Sell Buy Orders Function :
void FSELL()
  {    
   if(BLOCKTRADES/*||SELLHEDGE*/){
      return;
   }
      if(TP!=0){Sellt=NormalizeDouble(Bid-TP*MyPoint,_Digits); } else Sellt=0;
     
   FIRSTSELLLOT=firstlot();
   int sell=OrderSend(Symbol(),OP_SELL,FIRSTSELLLOT,Bid,50,0,Sellt,EaName,magic,0,clrRed);
   if(sell<0)
     {
      Print("sell failed with error #",GetLastError());
     }
   else
     {
      Debug("fsell placed successfully");
     }
  }
////////////////////////////////////////   sum(OpenPrice*Lots)/Sum(Lotsize)

void FBUY()
  {  
   if(BLOCKTRADES/*||BUYHEDGE*/){
      return;
   }
  if(TP!=0){Buyt=NormalizeDouble(Ask+TP*MyPoint,Digits);}else {Buyt=0;}
                                                  
   FIRSTBUYLOT=firstlot();
   int buy=OrderSend(Symbol(),OP_BUY,FIRSTBUYLOT,Ask,50,Buys,Buyt,EaName,magic,0,clrBlue);
   if(buy<0)
     {
      Print("buy failed with error #",GetLastError());
     }
   else
     {
      Debug("fbuy placed successfully");
     }
  }
//+------------------------------------------------------------------+
double BigOpSell()
{
  double pp=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp || pp==0)
           {
           
           pp=OrderOpenPrice();
           }
           }
         }
 return(pp);
 }
 
//+------------------------------------------------------------------+
double SmalOpSell()
{
  double pp=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0)
           {
           pp=OrderOpenPrice();}}
         }
 return(pp);
 }
//+------------------------------------------------------------------+
double SmalOpBuy()
{
  double pp=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0)
           {
           pp=OrderOpenPrice();}}
         }
 return(pp);
 }

//+------------------------------------------------------------------+
double BigOpBuy()
{
  double pp=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp || pp==0)
           {
           
           pp=OrderOpenPrice();
           }
           }
         }
 return(pp);
 }
//+------------------------------------------------------------------+

double lastOrderInfo(string N, int type=-1)
  {int Count=OrdersTotal();
    for(int i=Count-1;i>=0;i--){
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
       if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic&&(OrderType()==type||type==-1))
       {
         Debug("ticket = " + OrderTicket());
        if(N=="type")     return(OrderType());
   
   else if(N=="Lots")     return(OrderLots());
   else if(N=="TP")     return(OrderTakeProfit()); 
   else if(N=="SL")     return(OrderStopLoss());  
   else if(N=="Price")    return(OrderOpenPrice());
   else if(N=="Ticket")   return(OrderTicket());  
   
   }
   }}return(0);
 
 }
 

datetime lastOrdertime(int type=-1)
  {int Count=OrdersTotal();
    for(int i=Count-1;i>=0;i--){
      if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)){
       if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic&&(OrderType()==type||type==-1))
       {
        return(OrderOpenTime()); 
   }
   }}return(0);
 
 }

// -----------------------number of sell deal
int TS () {
 int s=0,i;
 for(i=0;i<OrdersTotal();i++){
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
 if(Symbol()==OrderSymbol()&&OrderType()==OP_SELL&&OrderMagicNumber()==magic)
 {
  s++;}}
  return(s);
  }
 //----------------------- number of buy deal  
int TB () {
 int b=0,i;
 for(i=0;i<OrdersTotal();i++){
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
 if(Symbol()==OrderSymbol()&&OrderType()==OP_BUY&&OrderMagicNumber()==magic)
 {
  b++;}}
  return(b);
  } 
  
 //+------------------------------------------------------------------+
 int Total(int type=-1){
 int total=0,i;
 for(i=0;i<OrdersTotal();i++){
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
 if(Symbol()==OrderSymbol() &&(OrderType()==type || type==-1)&&OrderMagicNumber()==magic)
{
total++;}}
return (total);
}

//------------------------
 void CA(){

for(cnt=OrdersTotal()-1;cnt>=0;cnt--)
if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
if(OrderSymbol()==Symbol()&&(OrderMagicNumber()==magic ) )
  {
  if(OrderType()==OP_BUY/*&&!BUYHEDGE*/)
  {   zs=OrderClose(OrderTicket(),OrderLots(),Bid, 3,clrNONE);}
  
  else if(OrderType()==OP_SELL/*&&!SELLHEDGE*/)
  {   zs=OrderClose(OrderTicket(),OrderLots(),Ask, 3,clrNONE);}
  
  else {   zs=OrderDelete(OrderTicket(),clrNONE);}}
  if (Total()>0){CA();}} 

//------------ ----------------
double SymbolProfit(){
      double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++){
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
             if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic){
                p=p+OrderProfit()+OrderCommission()+OrderSwap();}
                }
 return(p);
 }
  //-------------------------------
double SellProfit(){
      double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++){
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
             if(OrderSymbol()==Symbol())
             if(OrderType()==OP_SELL&&OrderMagicNumber()==magic){
                p=p+OrderProfit()+OrderCommission()+OrderSwap();}
                }
 return(p);
 }
 //-----------
double BuyProfit(){
      double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++){
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
             if(OrderSymbol()==Symbol())
              if(OrderType()==OP_BUY&&OrderMagicNumber()==magic){
                p=p+OrderProfit()+OrderCommission()+OrderSwap();}
                }
 return(p);
 }
//--------------------cnt=OrdersTotal()-1;cnt>=0;cnt------


   //------------------------
void CS(){
for(cnt=OrdersTotal()-1;cnt>=0;cnt--)
if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
if(OrderSymbol()==Symbol() && OrderType()==OP_SELL&&OrderMagicNumber()==magic/*&&!SELLHEDGE*/)
{
bool close_s=OrderClose(OrderTicket(),OrderLots(),Ask,3,clrRed);}}

//-------------------------close buy:
void CB(){
for(cnt=OrdersTotal()-1;cnt>=0;cnt--)
if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
if(OrderSymbol()==Symbol() && OrderType()==OP_BUY&&OrderMagicNumber()==magic/*&&!BUYHEDGE*/)
{
bool close_b=OrderClose(OrderTicket(),OrderLots(),Bid,3,clrGreen);}}


//-------------------------------------------------------------------+
//+------------------------------------------------------------------+
int bigsellticket()
{
  double pp=0;int p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp || pp==0)
           {
           
           pp=OrderOpenPrice();
           p=OrderTicket();
           }
           }
         }
 return(p);
 }
 
 double bigsellprofit()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp || pp==0)
           {
           
           pp=OrderOpenPrice();
           p=OrderProfit()+OrderCommission()+OrderSwap();
           }
           }
         }
 return(p);
 }

 double bigselllot()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp || pp==0)
           {
           
           pp=OrderOpenPrice();
           p=OrderLots();
           }
           }
         }
 return(p);
 }
//+------------------------------------------------------------------+
int smalsellticket()
{
  double pp=0;int p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0 )
           {
           
           pp=OrderOpenPrice();
           p=OrderTicket();
           }
           }
         }
 return(p);
 }

//+------------------------------------------------------------------+
double smalsellOP()
{
  double pp=0; 
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0 )
           {
           
           pp=OrderOpenPrice();
           }
           }
         }
 return(pp);
 }


double smalsellprofit()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0 )
           {
           
           pp=OrderOpenPrice();
           p=OrderProfit()+OrderCommission()+OrderSwap();
           }
           }
         }
 return(p);
 }
 double smalselllot()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0 )
           {
           
           pp=OrderOpenPrice();
           p=OrderLots();
           }
           }
         }
 return(p);
 }
//+------------------------------------------------------------------+
int bigbuyticket()
{
  double pp=0;int p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderTicket();}}
         }
 return(p);
 }
 double bigbuyprofit()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderProfit()+OrderCommission()+OrderSwap();}}
         }
 return(p);
 }
 
 double bigbuylot()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderLots();}}
         }
 return(p);
 }

 double bigbuyOP()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()>pp||pp==0)
           {
           pp=OrderOpenPrice();}}
         }
 return(pp);
 }

//+------------------------------------------------------------------+
int smalbuyticket()
{
  double pp=0;int p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderTicket();}}
         }
 return(p);
 }

double smalbuyprofit()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderProfit()+OrderCommission()+OrderSwap();}}
         }
 return(p);
 }
 
double smalbuylot()
{
  double pp=0;double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           {
           if(OrderOpenPrice()<pp||pp==0)
           {
           pp=OrderOpenPrice();
           p=OrderLots();}}
         }
 return(p);
 }
 
 
 //----------------------------------------- Sum lotsizes : Bys/ sell

 double LOTTss() {
 double s=0;
 int i;
 for(i=0;i<OrdersTotal();i++){
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
 if(Symbol()==OrderSymbol()&&OrderType()==OP_SELL&&OrderMagicNumber()==magic)
 {
  s+=OrderLots();}}
  return(s);
  }
//------------------------ 
double LOTTbb() {
 double s=0;
 int i;
 for(i=0;i<OrdersTotal();i++){
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
 if(Symbol()==OrderSymbol()&&OrderType()==OP_BUY&&OrderMagicNumber()==magic)
 {
  s+=OrderLots();}}
  return(s);
  }
//----------------------- Somme (Open Price *Lot)  buy sell
 double SOPLB()
{
  double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_BUY && OrderMagicNumber()==magic)
           { 
           p+=OrderOpenPrice()*OrderLots();
           }
         }
 return(p);
 }

//-------------------
 double SOPLS()
{
  double p=0;
        for(cnt=0;cnt<OrdersTotal();cnt++)
        {
           if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
           if(OrderSymbol()==Symbol() && OrderType()==OP_SELL && OrderMagicNumber()==magic)
           {
           p+=OrderOpenPrice()*OrderLots();
           }
         }
 return(p);
 }

//----------------------------
void Panel() {
   Comment("", " Forex Account Server:", AccountServer(), 
      "\n", "_________________________", 
      "\n  ",
      "\n", "***** Hedged Basket Retrieval Ea ***** ",      
       "\n", " Symbol: ", Symbol(),
      "\n", " Starting Lots =  ", Initial_Lotsize, 
      "\n", " Max Trades = ", MAX_Open_Trade, 
      "\n"," Total Buy Positions =",TB(), 
      "\n"," Total Sell Positions =",TS(),
      "\n"," Spread Limit=",MaxSpread,  
      "\n", " Current Spread=",spread,
      "\n", " Profit/Loss=",SymbolProfit(), 
      "\n", " Trading Blocked=", BLOCKTRADES,     
      "\n", " Buy Hedge=", BUYHEDGE,  
      "\n", " Sell Hedge=", SELLHEDGE,  
      "\n", " High Watermark=", HIGHWATERMARK,  
      "\n", " Current Buy Profit=", ProfitInDirection(1), 
      "\n", " Current Sell Profit=", ProfitInDirection(-1), 
      "\n", "_________________________", 
    "\n" );
     }
///-----------------------------------------




//----------------------------------

   //------------------------------------------------------------------- 
 void TPBuyModif(){
for(cnt=OrdersTotal()-1;cnt>=0;cnt--){
   
 if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic)
   
   if(OrderType()==OP_BUY/*&&!BUYHEDGE*/)
      
    if( OrderTakeProfit()!=0)
    {
    
      zs=OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),0,0,clrNONE);               
}}}

 
 void TPSellModif(){ 
for(cnt=OrdersTotal()-1;cnt>=0;cnt--){
 if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic)
   if(OrderType()==OP_SELL/*&&!SELLHEDGE*/)
    if( OrderTakeProfit()!=0)
    {
      zs=OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),0,0,clrNONE);               
}}}


//---------------------------

void TSBuy(){
  
for(cnt=OrdersTotal()-1;cnt>=0;cnt--){
 if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  if(OrderSymbol()==Symbol()&&OrderMagicNumber()==magic)
   if(OrderType()==OP_BUY/*&&!BUYHEDGE*/)
    if(Bid-OrderOpenPrice()>TrailingStop*MyPoint)
    {
     if(OrderStopLoss()==0||OrderStopLoss()<Bid-TrailingStep*MyPoint)
      zs=OrderModify(OrderTicket(),OrderOpenPrice(),Bid-TrailingStep*MyPoint,OrderTakeProfit(),0,clrNONE);
   }}}
   
   
void TSSell(){
  
for(cnt=OrdersTotal()-1;cnt>=0;cnt--){
 if(OrderSelect(cnt,SELECT_BY_POS,MODE_TRADES))
  if(OrderSymbol()==Symbol())
   if(OrderType()==OP_SELL&&OrderMagicNumber()==magic/*&&!SELLHEDGE*/)
    if(OrderOpenPrice()-Ask>TrailingStop*MyPoint)
     if(OrderStopLoss()==0||OrderStopLoss()>Ask+TrailingStep*MyPoint)
      zs=OrderModify(OrderTicket(),OrderOpenPrice(),Ask+TrailingStep*MyPoint,OrderTakeProfit(),0,clrNONE);
                

}
}



//------------------------------------------------------------------

bool checktradingDay()
{
   if(UTD==false){ return true;}
   

if(TOM==true&&DayOfWeek()==1)  { return true;}
if(TOT==true&&DayOfWeek()==2)  { return true;} 
if(TOW==true&&DayOfWeek()==3)  { return true;}
if(TOTH==true&&DayOfWeek()==4) { return true;}
if(TOF==true&&DayOfWeek()==5)  { return true;}
      
   return false;}
//------------------------------------------------------------------
bool checktradingTime()
{
   if(UTT==false){ return true;}

 datetime now=TimeCurrent();  
// Trading Session start/end and time current :

     end2=StrToTime(IntegerToString(TimeYear(now))+"."+IntegerToString(TimeMonth(now))+"."+IntegerToString(TimeDay(now))+" "+EndTrading);
     start2=StrToTime(IntegerToString(TimeYear(now))+"."+IntegerToString(TimeMonth(now))+"."+IntegerToString(TimeDay(now))+" "+StartTrading);

if(UTT==true&&(now>=start2&&now<end2))  {return true;}
      
   return false;}
   
   

//----------------------------------------------------------------

//------------------------------- Split String
string tpn(string comment, int tpt=1)
  {
   string to_split=comment;   // A string to split into substrings
   string sep=",";                // A separator as a character
   ushort u_sep;                  // The code of the separator character
   string result[];               // An array to get strings
//--- Get the separator code
   u_sep=StringGetCharacter(sep,0);
//--- Split the string to substrings
   int k=StringSplit(to_split,u_sep,result);
//--- Show a comment
 //  PrintFormat("Strings obtained: %d. Used separator '%s' with the code %d",k,sep,u_sep);
//--- Now output all obtained strings
 /*  if(k>0)
     {
      for(int i=0; i<k; i++)
        {
         PrintFormat("result[%d]=%s",i,result[i]);
        }
     }*/

   return (result[tpt-1]);
  }
  


//+------------------------------------------------------------------+ 
bool TextCreate(const long              chart_ID=0,               // chart's ID 
                const string            name="Text",              // object name 
                datetime                time=0,                   // anchor point time 
                double                  price=0,                  // anchor point price 
                const string            text="Text",              // the text itself 

                const color             clr=clrRed)                // priority for mouse click 
  { 
//--- set anchor point coordinates if they are not set 
   ChangeTextEmptyPoint(time,price); 
//--- reset the error value 
   ResetLastError(); 
//--- create Text object 
   if(!ObjectCreate(chart_ID,name,OBJ_TEXT,0,time,price)) 
     { 
      Print(__FUNCTION__, 
            ": failed to create \"Text\" object! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- set the text 
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text); 
//--- set text font 
   ObjectSetString(chart_ID,name,OBJPROP_FONT,"Arial"); 
//--- set font size 
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,11); 
//--- set the slope angle of the text 
   ObjectSetDouble(chart_ID,name,OBJPROP_ANGLE,0.0); 
//--- set anchor type 
   ObjectSetInteger(chart_ID,name,OBJPROP_ANCHOR,ANCHOR_RIGHT_UPPER); 
//--- set color 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,false); 
//--- enable (true) or disable (false) the mode of moving the object by mouse 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,true); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,true); // !!!
//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,true); 
//--- set the priority for receiving the event of a mouse click in the chart 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,0); 
//--- successful execution 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Move the anchor point                                            | 
//+------------------------------------------------------------------+ 
bool TextMove(const long   chart_ID=0,  // chart's ID 
              const string name="Text", // object name 
              datetime     time=0,      // anchor point time coordinate 
              double       price=0)     // anchor point price coordinate 
  { 
//--- if point position is not set, move it to the current bar having Bid price 
   if(!time) 
      time=TimeCurrent(); 
   if(!price) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- reset the error value 
   ResetLastError(); 
//--- move the anchor point 
   if(!ObjectMove(chart_ID,name,0,time,price)) 
     { 
      Print(__FUNCTION__, 
            ": failed to move the anchor point! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- successful execution 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Change the object text                                           | 
//+------------------------------------------------------------------+ 
bool TextChange(const long   chart_ID=0,  // chart's ID 
                const string name="Text", // object name 
                const string text="Text") // text 
  { 
//--- reset the error value 
   ResetLastError(); 
//--- change object text 
   if(!ObjectSetString(chart_ID,name,OBJPROP_TEXT,text)) 
     { 
      Print(__FUNCTION__, 
            ": failed to change the text! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- successful execution 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Delete Text object                                               | 
//+------------------------------------------------------------------+ 
bool TextDelete(const long   chart_ID=0,  // chart's ID 
                const string name="Text") // object name 
  { 
//--- reset the error value 
   ResetLastError(); 
//--- delete the object 
   if(!ObjectDelete(chart_ID,name)) 
     { 
      Print(__FUNCTION__, 
            ": failed to delete \"Text\" object! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- successful execution 
   return(true); 
  } 
//+------------------------------------------------------------------+ 
//| Check anchor point values and set default values                 | 
//| for empty ones                                                   | 
//+------------------------------------------------------------------+ 
void ChangeTextEmptyPoint(datetime &time,double &price) 
  { 
//--- if the point's time is not set, it will be on the current bar 
   if(!time) 
      time=TimeCurrent(); 
//--- if the point's price is not set, it will have Bid value 
   if(!price) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
  } 
  

//-----------------
//-----------------------------   
double compoundinglotbuy(){
  double Lot=0;
  double compoundingmultiplier=FIRSTBUYLOT/FIRSTLOT;
  double Target_lot1=Target_lot1_input*compoundingmultiplier;
  double Target_lot2=Target_lot2_input*compoundingmultiplier;
  
  Debug("Target Lot1 = " + Target_lot1);
  Debug("Target Lot2 = " + Target_lot2);
  
  
 if(Use_Lot==Change_by_Lots){
 
  if(TB()<Start_Level_Lot){Lot =ComLotB;}
  if(TB()>=Start_Level_Lot){   // Phase Lotsize ( Add )
  
  if(BUYPHASE==1){
         if( Lot_Change_Phase1==0) { Lot=ComLotB;Print("scenario 2");}
         if( Lot_Change_Phase1>0 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1;
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( BUYPHASE==1&&lastOrderInfo("Lots",OP_BUY)<NL(Target_lot1))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  BUYPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }
         if( Lot_Change_Phase1<0 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( BUYPHASE==1&&lastOrderInfo("Lots",OP_BUY)>NL(Target_lot1))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  BUYPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }          
      }   
      
      if(BUYPHASE==2){
         if( Lot_Change_Phase2==0) { Lot=lastOrderInfo("Lots",OP_BUY);Print("scenario 2a");}
         if( Lot_Change_Phase2>0 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( BUYPHASE==2&&lastOrderInfo("Lots",OP_BUY)<NL(Target_lot2))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  BUYPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotbuy());
               }
            } 
         }
         if( Lot_Change_Phase2<0 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase1; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( BUYPHASE==2&&lastOrderInfo("Lots",OP_BUY)>NL(Target_lot2))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_BUY)+Lot_Change_Phase2,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  BUYPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotbuy());
               }
            } 
         }          
      }    
      
      
   
    }
    } // End change by lot :
 
//----------------------- CHANGE BY RATE //// !!!!!! START 

 if(Use_Lot==Change_by_Rate){
   Debug("change by rate");
  if(TB()<Start_Level_Lot){Lot =ComLotB;Debug("TB()<start level lot");Print("scenario 1");}
  if(TB()>=Start_Level_Lot){   // Phase Lotsize ( Add )
      if(BUYPHASE==1){
         if( Rate_Change_Phase1==100) { Lot=lastOrderInfo("Lots",OP_BUY);Print("scenario 2");}
         if( Rate_Change_Phase1>100 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( BUYPHASE==1&&lastOrderInfo("Lots",OP_BUY)<NL(Target_lot1))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  BUYPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }
         if( Rate_Change_Phase1<100 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( BUYPHASE==1&&lastOrderInfo("Lots",OP_BUY)>NL(Target_lot1))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase1/100,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  BUYPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }          
      }   
      
      if(BUYPHASE==2){
         if( Rate_Change_Phase2==100) { Lot=lastOrderInfo("Lots",OP_BUY);Print("scenario 2a");}
         if( Rate_Change_Phase2>100 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( BUYPHASE==2&&lastOrderInfo("Lots",OP_BUY)<NL(Target_lot2))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  BUYPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotbuy());
               }
            } 
         }
         if( Rate_Change_Phase2<100 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( BUYPHASE==2&&lastOrderInfo("Lots",OP_BUY)>NL(Target_lot2))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_BUY)*Rate_Change_Phase2/100,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  BUYPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotbuy());
               }
            } 
         }          
      }                          

    }
    } // End change by RATE  :

   Print("lot here is " + Lot);
   if(Lot<MarketInfo(Symbol(),MODE_MINLOT))Lot=MarketInfo(Symbol(),MODE_MINLOT);
   if(Lot>MarketInfo(Symbol(),MODE_MAXLOT))Lot=MarketInfo(Symbol(),MODE_MAXLOT);
   
   Print("returning buy lot as " + Lot);
  return(NormalizeDouble(Lot,2));

  }
  

//-----------------------------   
double compoundinglotsell(){

  double Lot=0;
  double compoundingmultiplier=FIRSTSELLLOT/FIRSTLOT;
  double Target_lot1=Target_lot1_input*compoundingmultiplier;
  double Target_lot2=Target_lot2_input*compoundingmultiplier;
  
  Print("tl1 = "+Target_lot1);
  Print("tl2 = "+Target_lot2);
  Print("firstlot = " + FIRSTSELLLOT);
  Print("FIRSTLOT = " + FIRSTLOT);
  
 if(Use_Lot==Change_by_Lots){
 
  if(TS()<Start_Level_Lot){Lot =ComLotS;}
  if(TS()>=Start_Level_Lot){   // Phase Lotsize ( Add )
   if(SELLPHASE==1){
         if( Lot_Change_Phase1==0) { Lot=ComLotB;Print("scenario 2");}
         if( Lot_Change_Phase1>0 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1;
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( SELLPHASE==1&&lastOrderInfo("Lots",OP_SELL)<NL(Target_lot1))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  SELLPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }
         if( Lot_Change_Phase1<0 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( SELLPHASE==1&&lastOrderInfo("Lots",OP_SELL)>NL(Target_lot1))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  SELLPHASE=2;
                  Print("Entering Buy Phase 2");
               }
            } 
         }          
      }   
      
      if(SELLPHASE==2){
         if( Lot_Change_Phase2==0) { Lot=lastOrderInfo("Lots",OP_SELL);Print("scenario 2a");}
         if( Lot_Change_Phase2>0 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( SELLPHASE==2&&lastOrderInfo("Lots",OP_SELL)<NL(Target_lot2))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  SELLPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotsell());
               }
            } 
         }
         if( Lot_Change_Phase2<0 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase1; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( SELLPHASE==2&&lastOrderInfo("Lots",OP_SELL)>NL(Target_lot2))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_SELL)+Lot_Change_Phase2,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  SELLPHASE=1;
                  Print("Entering Buy Phase 1");
                  return(compoundinglotsell());
               }
            } 
         }          
      }    
   
    }
    } // End change by lot :
 
//----------------------- CHANGE BY RATE //// !!!!!! START 

 if(Use_Lot==Change_by_Rate){

  if(TS()<Start_Level_Lot){Lot =ComLotS;Print("scenario 1");}
  if(TS()>=Start_Level_Lot){   // Phase Lotsize ( Add )
      if(SELLPHASE==1){
         if( Rate_Change_Phase1==100) { Lot=lastOrderInfo("Lots",OP_SELL);Print("scenario 2");}
         if( Rate_Change_Phase1>100 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( SELLPHASE==1&&lastOrderInfo("Lots",OP_SELL)<NL(Target_lot1))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  SELLPHASE=2;
                  Print("Entering Sell Phase 2");
               }
            } 
         }
         if( Rate_Change_Phase1<100 ) {
            if(Target_lot1==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100; 
               Print("scenario 3");
            } 
            if(Target_lot1 >0) { 
               if( SELLPHASE==1&&lastOrderInfo("Lots",OP_SELL)>NL(Target_lot1))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase1/100,Target_lot1);
                  Print("scenario 4");
               }
               else{
                  SELLPHASE=2;
                  Print("Entering Sell Phase 2");
               }
            } 
         }          
      }   
      
      if(SELLPHASE==2){
         if( Rate_Change_Phase2==100) { Lot=lastOrderInfo("Lots",OP_SELL);Print("scenario 2a");}
         if( Rate_Change_Phase2>100 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( SELLPHASE==2&&lastOrderInfo("Lots",OP_SELL)<NL(Target_lot2))  {
                  Lot=MathMin( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  SELLPHASE=1;
                  Print("Entering Sell Phase 1");
                  return(compoundinglotsell());
               }
            } 
         }
         if( Rate_Change_Phase2<100 ) {
            if(Target_lot2==0) { 
               Lot=lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100; 
               Print("scenario 3a");
            } 
            if(Target_lot2 >0) { 
               if( SELLPHASE==2&&lastOrderInfo("Lots",OP_SELL)>NL(Target_lot2))  {
                  Lot=MathMax( lastOrderInfo("Lots",OP_SELL)*Rate_Change_Phase2/100,Target_lot2);
                  Print("scenario 4a");
               }
               else{
                  SELLPHASE=1;
                  Print("Entering Sell Phase 1");
                  return(compoundinglotsell());
               }
            } 
         }          
      }             
                  
   
            }
    } // End change by RATE  :

   Print("Lot here is " + Lot);
   if(Lot<MarketInfo(Symbol(),MODE_MINLOT))Lot=MarketInfo(Symbol(),MODE_MINLOT);
   if(Lot>MarketInfo(Symbol(),MODE_MAXLOT))Lot=MarketInfo(Symbol(),MODE_MAXLOT);
   Print("returning sell lot as " + Lot);
    
  return(NormalizeDouble(Lot,2));

  }


  

double CLOSE()
{
   return(iClose(Symbol(),PERIOD_CURRENT,1));   
}




//+----------------------------------------- line create
bool HLineCreate(
                 const string          name="HLine",      // line name 
                 const int             sub_window=0,      // subwindow index 
                 double                price=0,           // line price 
                 const color           clr=clrRed,        // line color 
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // line style 
                 const int             width=1,           // line width 
                 const bool            back=false,        // in the background 
                 const bool            selection=true,    // highlight to move 
                 const bool            hidden=false,       // hidden in the object list 
                 const long            z_order=0)         // priority for mouse click 
  { 

   
//--- if the price is not set, set it at the current Bid price level 
   if(price==0) price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- reset the error value 
   ResetLastError(); 
//--- create a horizontal line 
   if(!ObjectCreate(0,name,OBJ_HLINE,sub_window,TimeCurrent(),price)) 
     { 
      Print(__FUNCTION__, 
            ": failed to create a horizontal line! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- set line color 
   ObjectSetInteger(0,name,OBJPROP_COLOR,clr); 
//--- set line display style 
   ObjectSetInteger(0,name,OBJPROP_STYLE,style); 
//--- set line width 
   ObjectSetInteger(0,name,OBJPROP_WIDTH,width); 
//--- display in the foreground (false) or background (true) 
   ObjectSetInteger(0,name,OBJPROP_BACK,back); 
//--- enable (true) or disable (false) the mode of moving the line by mouse 
//--- when creating a graphical object using ObjectCreate function, the object cannot be 
//--- highlighted and moved by default. Inside this method, selection parameter 
//--- is true by default making it possible to highlight and move the object 
   ObjectSetInteger(0,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(0,name,OBJPROP_SELECTED,selection); 
//--- hide (true) or display (false) graphical object name in the object list 
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,hidden); 
//--- set the priority for receiving the event of a mouse click in the chart 
   ObjectSetInteger(0,name,OBJPROP_ZORDER,z_order); 
//--- successful execution 

   return(true); 
  }
  




//------------------------------------ move line 

bool HLineMove(const long   chart_ID=0,   // chart's ID 
               const string name="BuyStart", // line name 
               double       price=0)      // line price 
  { 
//--- if the line price is not set, move it to the current Bid price level 
   if(price==0) 
      price=SymbolInfoDouble(Symbol(),SYMBOL_BID); 
//--- reset the error value 
   ResetLastError(); 
//--- move a horizontal line 
   if(!ObjectMove(chart_ID,name,0,0,price)) 
     { 
      Print(__FUNCTION__, 
            ": failed to move the horizontal line! Error code = ",GetLastError()); 
      return(false); 
     } 
//--- successful execution 
   return(true); 
  } 


//------------------------------------------
bool BuySignal(){
bool result=false;

 double MA2=iMA(Symbol(),MA_Timeframe,MAPeriod,0,MAMethod,Applied_Price,0);
   
   if(Bid>MA2){ result= true;}else {result= false;} 
   
   return (result);
   }

bool SellSignal(){
bool result=false;
 double MA2=iMA(Symbol(),MA_Timeframe,MAPeriod,0,MAMethod,Applied_Price,0);
  
   if(MA2>Bid){ result= true;}else {result= false;} 
    
   return (result);
   }

//------------------------------------------
bool BuySignalP(){
bool result=false;

 double MA2=iMA(Symbol(),MA_TimeframePruning,MAPeriodPruning,0,MAMethodPruning,Applied_PricePruning,0);
   
   if(Bid>MA2){ result= true;}else {result= false;} 
   
   return (result);
   }

bool SellSignalP(){
bool result=false;
 double MA2=iMA(Symbol(),MA_TimeframePruning,MAPeriodPruning,0,MAMethodPruning,Applied_PricePruning,0);
  
   if(MA2>Bid){ result= true;}else {result= false;} 
    
   return (result);
   }
   
   

   

//------------------------------------------
bool FilterBuy(){
   
   if(Use_Ma1_Entry){
      double MA1=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,0);
      double MA1last=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,1);
      double MA1last2=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,2);
      if(Close[0]<=MA1){ // if price is below ma, don't buy
         Debug("Buy Trade Filtered by MA1");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA1 = " + DoubleToStr(MA1,Digits));
         return(false);
      }
      double recentchange = MA1-MA1last;
      double lastchange = MA1last-MA1last2;
      if(lastchange<=MinimumDelta*Point()||recentchange<=MinimumDelta*Point()){
         Debug("Buy Trade Filtered by MA1 Delta");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA1 = " + DoubleToStr(MA1,Digits));
         Debug("MA1last = " + DoubleToStr(MA1last,Digits)+ " MA1last2 = " + DoubleToStr(MA1last2,Digits));
         Debug("recent change = " + DoubleToStr(recentchange,Digits)+ " last change = "+DoubleToStr(lastchange,Digits));
         return(false);
      }
   }
   if(Use_Ma2_Entry){
      double MA2=iMA(Symbol(),MATf2,MAPeriod2,0,MAMethod2,MAPrice2,0);
      if(Close[0]<=MA2){ // if price is below ma, don't buy
         Debug("Buy Trade Filtered by MA2");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA2 = " + DoubleToStr(MA2,Digits));
         return(false);
      }
   }
   if(Use_Ma1_Entry&&Use_Ma2_Entry){
      double MA1=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,0);
      double MA2=iMA(Symbol(),MATf2,MAPeriod2,0,MAMethod2,MAPrice2,0);
      if(MA2>=MA1){
         Debug("Buy Trade Filtered by MA1 and MA2 comparison");
         Debug("Close = " + DoubleToStr(MA1,Digits)+ " MA2 = " + DoubleToStr(MA2,Digits));
         return(false);
      }
   }
   
   if(UseRSI){
      double rsi = iRSI(Symbol(),Period(),RSIPeriod,RSIPrice,0);
      if(rsi>RSIHigh){
         Debug("Buy Trade Filtered by RSI");
         Debug("RSI = " + DoubleToStr(rsi,Digits));
         return(false);
      }
   }
   
   if(UseADX){
      double adx = iADX(Symbol(),Period(),ADXPeriod,ADXPrice,MODE_MAIN,0);
      double ma = iMA(Symbol(),GuideMATf,GuideMAPeriod,0,GuideMAMethod,GuideMAPrice,0);
      if(adx>HighADXValue){ // adx too high, only trade in direction of trend
         if(Close[0]<=ma){
            Debug("Buy Trade Filtered by ADX");
            Debug("ADX = " + DoubleToStr(adx,Digits));
            Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA = " + DoubleToStr(ma,Digits));
            return(false);
         }
      }
   }
   
   if(UseBollinger){
      double upper = iBands(Symbol(),Period(),BolPeriod,BolDeviations,0,BolPrice,MODE_UPPER,0);
      double lower = iBands(Symbol(),Period(),BolPeriod,BolDeviations,0,BolPrice,MODE_LOWER,0);
      
      if(Close[0]>=upper||Close[0]<=lower){
         Debug("Buy trade Filtered by Bollinger Bands");
         Debug("Close = " + DoubleToStr(Close[0],Digits));
         Debug("Upper = " + DoubleToStr(upper,Digits)+ " Lower = " + DoubleToStr(lower,Digits));
         return(false);
      }
   }
   return (true);
}

bool FilterSell(){
   
   if(Use_Ma1_Entry){
      double MA1=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,0);
      double MA1last=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,1);
      double MA1last2=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,2);
      if(Close[0]>=MA1){ // if price is above ma, don't sell
         Debug("Sell Trade Filtered by MA1");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA1 = " + DoubleToStr(MA1,Digits));
         return(false);
      }
      double recentchange = MA1last-MA1;
      double lastchange = MA1last2-MA1last;
      if(lastchange<=MinimumDelta*Point()||recentchange<=MinimumDelta*Point()){
         Debug("Sell Trade Filtered by MA1 Delta");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA1 = " + DoubleToStr(MA1,Digits));
         Debug("MA1last = " + DoubleToStr(MA1last,Digits)+ " MA1last2 = " + DoubleToStr(MA1last2,Digits));
         Debug("recent change = " + DoubleToStr(recentchange,Digits)+ " last change = "+DoubleToStr(lastchange,Digits));
         return(false);
      }
   }
   if(Use_Ma2_Entry){
      double MA2=iMA(Symbol(),MATf2,MAPeriod2,0,MAMethod2,MAPrice2,0);
      if(Close[0]>=MA2){ // if price is above ma, don't sell
         Debug("Sell Trade Filtered by MA2");
         Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA2 = " + DoubleToStr(MA2,Digits));
         return(false);
      }
   }
   if(Use_Ma1_Entry&&Use_Ma2_Entry){
      double MA1=iMA(Symbol(),MATf1,MAPeriod1,0,MAMethod1,MAPrice1,0);
      double MA2=iMA(Symbol(),MATf2,MAPeriod2,0,MAMethod2,MAPrice2,0);
      if(MA2<=MA1){
         Debug("Buy Trade Filtered by MA1 and MA2 comparison");
         Debug("Close = " + DoubleToStr(MA1,Digits)+ " MA2 = " + DoubleToStr(MA2,Digits));
         return(false);
      }
   }
   
   if(UseRSI){
      double rsi = iRSI(Symbol(),Period(),RSIPeriod,RSIPrice,0);
      if(rsi<RSILow){
         Debug("Sell Trade Filtered by RSI");
         Debug("RSI = " + DoubleToStr(rsi,Digits));
         return(false);
      }
   }
   
   if(UseADX){
      double adx = iADX(Symbol(),Period(),ADXPeriod,ADXPrice,MODE_MAIN,0);
      double ma = iMA(Symbol(),GuideMATf,GuideMAPeriod,0,GuideMAMethod,GuideMAPrice,0);
      if(adx>HighADXValue){ // adx too high, only trade in direction of trend
         if(Close[0]>=ma){
            Debug("Sell Trade Filtered by ADX");
            Debug("ADX = " + DoubleToStr(adx,Digits));
            Debug("Close = " + DoubleToStr(Close[0],Digits)+ " MA = " + DoubleToStr(ma,Digits));
            return(false);
         }
      }
   }
   
   if(UseBollinger){
      double upper = iBands(Symbol(),Period(),BolPeriod,BolDeviations,0,BolPrice,MODE_UPPER,0);
      double lower = iBands(Symbol(),Period(),BolPeriod,BolDeviations,0,BolPrice,MODE_LOWER,0);
      
      if(Close[0]>=upper||Close[0]<=lower){
         Debug("Sell trade Filtered by Bollinger Bands");
         Debug("Close = " + DoubleToStr(Close[0],Digits));
         Debug("Upper = " + DoubleToStr(upper,Digits)+ " Lower = " + DoubleToStr(lower,Digits));
         return(false);
      }
   }
   return (true);
}



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ButtonCreate(const long              chart_ID=0,               // chart's ID
                  const string            name="Button",            // button name
                  const int               sub_window=0,             // subwindow index
                  const int               x=0,                      // X coordinate
                  const int               y=0,                      // Y coordinate
                  const int               width=50,                 // button width
                  const int               height=18,                // button height
                  const ENUM_BASE_CORNER  corner=CORNER_LEFT_UPPER, // chart corner for anchoring
                  const string            text="Button",            // text
                  const string            font="Arial",             // font
                  const int               font_size=10,             // font size
                  const color             clr=clrBlack,             // text color
                  const color             back_clr=C'236,233,216',  // background color
                  const color             border_clr=clrWheat       // border color
                 )

{

   const bool              state=false;             // pressed/released
   const bool              back=false;               // in the background
   const bool              selection=false;          // highlight to move
   const bool              hidden=true;              // hidden in the object list
   const long              z_order=0;                // priority for mouse click
//--- reset the error value
   ResetLastError();
//--- create the button
   if(!ObjectCreate(chart_ID,name,OBJ_BUTTON,sub_window,0,0)) {
      Print(__FUNCTION__,
            ": failed to create " + name+ " the button! Error code = ",GetLastError());
      return(false);
   }
//--- set button coordinates
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y);
//--- set button size
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height);
//--- set the chart's corner, relative to which point coordinates are defined
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner);
//--- set the text
   ObjectSetString(chart_ID,name,OBJPROP_TEXT,text);
//--- set text font
   ObjectSetString(chart_ID,name,OBJPROP_FONT,font);
//--- set font size
   ObjectSetInteger(chart_ID,name,OBJPROP_FONTSIZE,font_size);
//--- set text color
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr);
//--- set background color
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr);
//--- set border color
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_COLOR,border_clr);

//--- display in the foreground (false) or background (true)
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back);
//--- set button state
   ObjectSetInteger(chart_ID,name,OBJPROP_STATE,state);
//--- enable (true) or disable (false) the mode of moving the button by mouse
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection);
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection);
//--- hide (true) or display (false) graphical object name in the object list
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden);
//--- set the priority for receiving the event of a mouse click in the chart
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order);
//--- successful execution
   return(true);
}


void DeleteAllObjects(string text)
{
   for(int i = ObjectsTotal() -1; i >=0; i--) {
      if(StringFind(ObjectName(i),text)>=0) {
         ObjectDelete(ObjectName(i));
      }
   }
}


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{

//--- Check the event by pressing a mouse button
   if(id==CHARTEVENT_OBJECT_CLICK) {
      string clickedChartObject=sparam;
      //--- If you click on the object with the name buttonID
      if(clickedChartObject=="Button Block New Trades") {
         BLOCKTRADES=true;
         Debug("Blocking All New Trades");
         ObjectDelete("Button Block New Trades");
         ButtonCreate(0,"Button Allow New Trades",0,120,20,100,30,CORNER_RIGHT_UPPER,"Allow New Trades","Arial",8,clrBlack,clrLime);
         
      }
      
      if(clickedChartObject=="Button Allow New Trades") {
         BLOCKTRADES=false;
         Debug("New Trades Allowed");
         ObjectDelete("Button Allow New Trades");
         ButtonCreate(0,"Button Block New Trades",0,120,20,100,30,CORNER_RIGHT_UPPER,"Block New Trades","Arial",8,clrBlack,clrRed);
      }

   }


}




void MarkExits()
{

   int pos=0;

   pos=0;
   for(pos = OrdersHistoryTotal()-1; pos >= 0 ; pos--) {
      bool check = OrderSelect(pos, SELECT_BY_POS,MODE_HISTORY);
      if(OrderMagicNumber()==magic&&OrderCloseTime()!=0) {
         //Debug(OrderTicket());

         if(STARTTIME>=0&&OrderCloseTime()<STARTTIME) {
            continue;
         }

         double profit=OrderProfit()+OrderCommission()+OrderSwap();
         datetime time = OrderCloseTime();
         double price = OrderClosePrice();
         string name = IntegerToString(OrderType())+" "+TimeToStr(time);
         color col=clrGray;
         if(profit>0){
            col=clrLime;
         }
         if(profit<0){
            col=clrRed;
         }
         if(ObjectFind(0,name)<0){
            ObjectCreate(0,name,OBJ_TEXT,0,time,price);
            ObjectSetText(name,DoubleToString(profit,2),8,NULL,col);
            ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_LEFT_UPPER);
         }
      }
   }

}
   
   
void SimulateBasketTPLines(){
   int pos=0;
   double buyprofit=0;
   double buylots=0;
   double sellprofit=0;
   double selllots=0;
   int buycount=0;
   int sellcount=0;
   
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--) {
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check&&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){
         if(OrderType()==OP_SELL){
            sellprofit=sellprofit+OrderProfit()+OrderCommission()+OrderSwap();
            selllots=selllots+OrderLots();
            sellcount++;
         }
         if(OrderType()==OP_BUY){
            buyprofit=buyprofit+OrderProfit()+OrderCommission()+OrderSwap();
            buylots=buylots+OrderLots();
            buycount++;
         }
      }
   }
   
   
   
   double tickval=MarketInfo(Symbol(), MODE_TICKVALUE);
   
   ObjectDelete("Buy Basket TP");
   ObjectDelete("Sell Basket TP");
   if(buycount>1){
      double buyshortfall=Basket*FIRSTBUYLOT/FIRSTLOT-buyprofit;
      double buyticksneeded=buyshortfall/tickval/buylots;
      double buyprice=Bid+buyticksneeded*Point;
      ObjectCreate(0,"Buy Basket TP",OBJ_HLINE,0,0,buyprice);
      ObjectSetInteger(0,"Buy Basket TP",OBJPROP_WIDTH,3);
      ObjectSetInteger(0,"Buy Basket TP",OBJPROP_COLOR,clrLimeGreen);
      
   }
   if(sellcount>1){
      double sellshortfall=Basket*FIRSTSELLLOT/FIRSTLOT-sellprofit;
      double sellticksneeded=sellshortfall/tickval/selllots;
      double sellprice=Ask-sellticksneeded*Point;
      ObjectCreate(0,"Sell Basket TP",OBJ_HLINE,0,0,sellprice);
      ObjectSetInteger(0,"Sell Basket TP",OBJPROP_WIDTH,3);
      ObjectSetInteger(0,"Sell Basket TP",OBJPROP_COLOR,clrRed);
   }

}



void Debug(string msg){
   if(UseDebug){
      Print(msg);
   }
}




int CountTradesInDirection(int direction){
   int pos=0;
   int count=0;
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--){
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check &&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){   
         if(OrderType()==OP_BUY&&direction>=0){
            count++;
         }
         if(OrderType()==OP_SELL&&direction<=0){
            count++;
         }
      }
   }
   return(count);
}

double ProfitInDirection(int direction){
   int pos=0;
   int count=0;
   double profit = 0;
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--){
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check &&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){   
         if(OrderType()==OP_BUY&&direction>=0){
            profit=profit+OrderProfit()+OrderSwap()+OrderCommission();
         }
         if(OrderType()==OP_SELL&&direction<=0){
            profit=profit+OrderProfit()+OrderSwap()+OrderCommission();
         }
      }
   }
   return(profit);
}

double LotsInDirection(int direction){
   int pos=0;
   int count=0;
   double lots = 0;
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--){
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check &&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){   
         if(OrderType()==OP_BUY&&direction>=0){
            lots=lots+OrderLots();
         }
         if(OrderType()==OP_SELL&&direction<=0){
            lots=lots+OrderLots();
         }
      }
   }
   return(lots);
}

double FindVirtualEntryPrice(int direction,double& maxlots){
   int pos=0;
   double price=0;
   double piplots=0;
   double maxlot=0;
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--){
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check &&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){   
         if(OrderType()==OP_BUY&&direction>=0){
            piplots=(Bid-OrderOpenPrice())*OrderLots();
            if(price<OrderOpenPrice()||price==0){
               price=OrderOpenPrice();
            }
            maxlot=maxlot+OrderLots();
         }
         if(OrderType()==OP_SELL&&direction<=0){
            piplots=(OrderOpenPrice()-Ask)*OrderLots();
            if(price>OrderOpenPrice()||price==0){
               price=OrderOpenPrice();
            }
            maxlot=maxlot+OrderLots();
         }
      }
   }
   if(piplots==0){
      return(0);
   }
   
   double tickval=MarketInfo(Symbol(), MODE_TICKVALUE);
   
   

   maxlots=maxlot;
   return(price);
}

void FillArray(int &array[],int direction){
   int pos=0;
   int size=0;
   ArrayResize(array,0);
   for(pos = OrdersTotal()-1; pos >= 0 ; pos--){
      bool check = OrderSelect(pos, SELECT_BY_POS);
      if(check &&OrderMagicNumber()==magic&&OrderSymbol()==Symbol()){   
         if(OrderType()==OP_BUY&&direction>=0){
            ArrayResize(array,size+1);
            array[size]=OrderTicket();
            size++;
         }
         if(OrderType()==OP_SELL&&direction<=0){
            ArrayResize(array,size+1);
            array[size]=OrderTicket();
            size++;
         }
      }
   }
}

double GetHedgeProfit(hedge &h){
   double profit=0;
   int size=ArraySize(h.initialtrades);
   int count=0;
   while(count<size){
      bool check=OrderSelect(h.initialtrades[count],SELECT_BY_TICKET);
      if(check){
         profit=profit+OrderProfit()+OrderSwap()+OrderCommission();
      }
      count++;
   }
   size=ArraySize(h.baskettrades);
   count=0;
   while(count<size){
      bool check=OrderSelect(h.baskettrades[count],SELECT_BY_TICKET);
      if(check){
         profit=profit+OrderProfit()+OrderSwap()+OrderCommission();
      }
      count++;
   }
   
   return(profit);
}

void CloseAllHedgeTrades(hedge &h){
   int size=ArraySize(h.initialtrades);
   int count=0;
   while(count<size){
      bool check=OrderSelect(h.initialtrades[count],SELECT_BY_TICKET);
      if(check){
         if(OrderType()==OP_BUY){
            check=OrderClose(OrderTicket(),OrderLots(),Bid,100);
         }
         else if(OrderType()==OP_SELL){
            check=OrderClose(OrderTicket(),OrderLots(),Ask,100);
         }
         else{
            check=OrderDelete(OrderTicket());
         }
      }
      count++;
   }
   size=ArraySize(h.baskettrades);
   count=0;
   while(count<size){
      bool check=OrderSelect(h.baskettrades[count],SELECT_BY_TICKET);
      if(check){
         if(OrderType()==OP_BUY){
            check=OrderClose(OrderTicket(),OrderLots(),Bid,100);
         }
         else if(OrderType()==OP_SELL){
            check=OrderClose(OrderTicket(),OrderLots(),Ask,100);
         }
         else{
            check=OrderDelete(OrderTicket());
         }
      }
      count++;
   }
}


int longentry(double Lots,string comments=""){

   int ordernum = OrderSend(Symbol(),OP_BUY,NL(Lots),Ask,10,0,0,comments,magic2,0,Lime);
   
   Debug("long entry");

   return(ordernum);
}

int shortentry(double Lots,string comments=""){

   int ordernum = OrderSend(Symbol(),OP_SELL,NL(Lots),Bid,10,0,0,comments,magic2,0,Red);
   
   Debug("short entry");

   return(ordernum);
}


double NL(double p){
    double ls = MarketInfo(Symbol(), MODE_LOTSTEP);
    double lots = MathRound(p/ls)*ls;
    lots=MathMax(lots,MarketInfo(Symbol(),MODE_MINLOT));
    lots=MathMin(lots,MarketInfo(Symbol(),MODE_MAXLOT));
    return( lots);
}
   


void ManageHedge(){
   if(!BUYHEDGE&&(LASTBUYHEDGETIME==0||LASTBUYHEDGETIME<=TimeCurrent()-HedgeBlackout*60)){
      double profit = ProfitInDirection(1);
      //Print("buy drawdown : " + (profit/HIGHWATERMARK*100));
      //Print("Account Equity : " + AccountEquity());
      if(profit/HIGHWATERMARK*100<Drawdown*(-1)){
      
         double maxlots=LotsInDirection(1);
         //Print("buy entryprice is " + entryprice);
         //Print("buy lots is " + maxlots);
         //Print("buy pips comparison = "+((entryprice-Bid)/MyPoint));

            BUYHEDGE=true;
            bhedge.hedging=true;
            FillArray(bhedge.initialtrades,1);
            int tic=shortentry(maxlots/100*HedgeFactor);
            
            ArrayResize(bhedge.baskettrades,1);
            bhedge.baskettrades[0]=tic;
            Print("start buy hedge trade");
            LASTBUYHEDGETIME=TimeCurrent();

      }
   }
   if(!SELLHEDGE&&(LASTSELLHEDGETIME==0||LASTSELLHEDGETIME<=TimeCurrent()-HedgeBlackout*60)){
      double profit = ProfitInDirection(-1);
      //Print("sell drawdown : " + (profit/HIGHWATERMARK*100));
      //Print("Account Equity : " + AccountEquity());
      if(profit/HIGHWATERMARK*100<Drawdown*(-1)){
      
         double maxlots=LotsInDirection(-1);
         double entryprice = FindVirtualEntryPrice(-1,maxlots);
         //Print("buy entryprice is " + entryprice);
         //Print("buy lots is " + maxlots);
         //Print("buy pips comparison = "+((entryprice-Bid)/MyPoint));

            SELLHEDGE=true;
            shedge.hedging=true;
            FillArray(shedge.initialtrades,-1);
            int tic=longentry(maxlots/100*HedgeFactor);
            
            ArrayResize(shedge.baskettrades,1);
            shedge.baskettrades[0]=tic;
            Print("start sell hedge trade");
            LASTSELLHEDGETIME=TimeCurrent();

      }
   }
   
   if(BUYHEDGE){
      bool check=OrderSelect(bhedge.baskettrades[0],SELECT_BY_TICKET);
      if(check){
         double hedgeprice = OrderOpenPrice();
         //double releaseprice = hedgeprice+RemoveHedge*MyPoint;
         bool mapass=false;
         bool pricepass=false;
         
         double ma1=iMA(Symbol(),HedgeMA1TF,HedgeMA1,0,MODE_SMA,PRICE_CLOSE,0); 
         double ma2=iMA(Symbol(),HedgeMA2TF,HedgeMA2,0,MODE_SMA,PRICE_CLOSE,0); 
         double lastma1=iMA(Symbol(),HedgeMA1TF,HedgeMA1,0,MODE_SMA,PRICE_CLOSE,1); 
         double lastma2=iMA(Symbol(),HedgeMA2TF,HedgeMA2,0,MODE_SMA,PRICE_CLOSE,1); 
         
         if(ma1>ma2&&lastma1<=lastma2){
            check=OrderClose(OrderTicket(),OrderLots(),Ask,100);
            if(check){
               BUYHEDGE=false;
               ArrayResize(bhedge.baskettrades,0);
               ArrayResize(bhedge.initialtrades,0);
               bhedge.hedging=false;
               Print("exit buy hedge trade");
            }
         }
         
         /*if(Ask>releaseprice){
            if(UseHedgeMAFilter){
               double ma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,0); 
               double ma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,0); 
               double ma3=iMA(Symbol(),Period(),HedgeMA3,0,MODE_SMA,PRICE_CLOSE,0);  
               
               double lastma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,1); 
               double lastma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,1); 
               double lastma3=iMA(Symbol(),Period(),HedgeMA3,0,MODE_SMA,PRICE_CLOSE,1);
               
               double spread1=ma1-ma2;
               double spread2=ma2-ma3;
               double lastspread1=lastma1-lastma2;
               double lastspread2=lastma2-lastma3;  
               
               if(spread1>0&&spread2>0&&lastspread1>0&&lastspread2>0&&
                spread1>lastspread1&&spread2>lastspread2){
                  mapass=true;
               }
                
            }
            if(!UseHedgeMAFilter||mapass){
               check=OrderClose(OrderTicket(),OrderLots(),Ask,100);
               if(check){
                  BUYHEDGE=false;
                  ArrayResize(bhedge.baskettrades,0);
                  ArrayResize(bhedge.initialtrades,0);
                  bhedge.hedging=false;
                  Print("exit buy hedge trade");
               }
            }
         }*/
      }
   }
   
   
   if(SELLHEDGE){
      bool check=OrderSelect(shedge.baskettrades[0],SELECT_BY_TICKET);
      if(check){
         double hedgeprice = OrderOpenPrice();
         //double releaseprice = hedgeprice-RemoveHedge*MyPoint;
         bool mapass=false;
         
         double ma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,0); 
         double ma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,0); 
         double lastma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,1); 
         double lastma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,1); 
         
         if(ma1<ma2&&lastma1>=lastma2){
            check=OrderClose(OrderTicket(),OrderLots(),Bid,100);
            if(check){
               SELLHEDGE=false;
               ArrayResize(shedge.baskettrades,0);
               ArrayResize(shedge.initialtrades,0);
               shedge.hedging=false;
               Print("exit sell hedge trade");
            }
         }
         
         /*if(Bid<releaseprice){
            if(UseHedgeMAFilter){
               double ma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,0); 
               double ma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,0); 
               double ma3=iMA(Symbol(),Period(),HedgeMA3,0,MODE_SMA,PRICE_CLOSE,0);  
               
               double lastma1=iMA(Symbol(),Period(),HedgeMA1,0,MODE_SMA,PRICE_CLOSE,1); 
               double lastma2=iMA(Symbol(),Period(),HedgeMA2,0,MODE_SMA,PRICE_CLOSE,1); 
               double lastma3=iMA(Symbol(),Period(),HedgeMA3,0,MODE_SMA,PRICE_CLOSE,1);
               
               double spread1=ma2-ma1;
               double spread2=ma3-ma2;
               double lastspread1=lastma2-lastma1;
               double lastspread2=lastma3-lastma2;  
               
               if(spread1>0&&spread2>0&&lastspread1>0&&lastspread2>0&&
                spread1>lastspread1&&spread2>lastspread2){
                  mapass=true;
               }
                
            }
            if(!UseHedgeMAFilter||mapass){
               check=OrderClose(OrderTicket(),OrderLots(),Bid,100);
               if(check){
                  SELLHEDGE=false;
                  ArrayResize(shedge.baskettrades,0);
                  ArrayResize(shedge.initialtrades,0);
                  shedge.hedging=false;
                  Print("exit sell hedge trade");
               }
            }
         }*/
      }
   }
}

/*
extern double Drawdown = 30; // Start At Drawdown(%)
extern double RemoveHedge = 10; // Hedge Removal(pips)
extern bool UseHedgeMAFilter = true; // Use Hedge MA Filter
extern int HedgeMA1 = 5; // Hedge MA1 Period
extern int HedgeMA2 = 10; // Hedge MA2 Period
extern int HedgeMA3 = 15; // Hedge MA3 Period
*/













/*
void ManageHedge(){
   if(!BUYHEDGE){
      double maxlots;
      double entryprice = FindVirtualEntryPrice(1,maxlots);
      //Print("buy entryprice is " + entryprice);
      //Print("buy lots is " + maxlots);
      //Print("buy pips comparison = "+((entryprice-Bid)/MyPoint));
      if(entryprice!=0&&(entryprice-Bid)/MyPoint>=RecoveryZone){
         BUYHEDGE=true;
         bhedge.hedging=true;
         FillArray(bhedge.initialtrades,1);
         int tic=shortentry(maxlots*HedgeMultiplier);
         
         ArrayResize(bhedge.baskettrades,1);
         bhedge.baskettrades[0]=tic;
         Print("start buy hedge trade");
         
      }
   }
   if(!SELLHEDGE){
      double maxlots;
      double entryprice = FindVirtualEntryPrice(-1,maxlots);
      //Print("sell entryprice is " + entryprice);
      //Print("sell lots is " + maxlots);
      //Print("sell pips comparison = "+((Ask-entryprice)/MyPoint));
      if(entryprice!=0&&(Ask-entryprice)/MyPoint>=RecoveryZone){
         SELLHEDGE=true;
         shedge.hedging=true;
         FillArray(shedge.initialtrades,-1);
         int tic =longentry(maxlots*HedgeMultiplier);
         
         ArrayResize(shedge.baskettrades,1);
         shedge.baskettrades[0]=tic;
         Print("start sell hedge trade");
      }
   }
   
   if(BUYHEDGE){
      if(GetHedgeProfit(bhedge)>=HedgeTakeProfit){
         CloseAllHedgeTrades(bhedge);
         BUYHEDGE=false;
         ArrayResize(bhedge.baskettrades,0);
         ArrayResize(bhedge.initialtrades,0);
         bhedge.hedging=false;
         Print("exit buy hedge trade");
      }
      
      //adding new layers
      int size=ArraySize(bhedge.baskettrades);
      if(size<MaximumOrders&&size>0){
         bool check = OrderSelect(bhedge.baskettrades[size-1],SELECT_BY_TICKET);
         if(check){
            double entryprice=OrderOpenPrice();
            int direction=OrderType();
            double maxlots=OrderLots();
            
            if(OrderType()==OP_BUY){
               if((entryprice-Bid)/MyPoint>=RecoveryZone){
                  int tic=shortentry(maxlots*HedgeMultiplier);
                  
                  ArrayResize(bhedge.baskettrades,size+1);
                  bhedge.baskettrades[size]=tic;
                  Print("added buy hedge");
               }
            }
            if(OrderType()==OP_SELL){
               if((Ask-entryprice)/MyPoint>=RecoveryZone){
                  int tic=longentry(maxlots*HedgeMultiplier);
                  
                  ArrayResize(bhedge.baskettrades,size+1);
                  bhedge.baskettrades[size]=tic;
                  Print("added buy hedge");
               }
            }
         }
      }
   }
   
   
   if(SELLHEDGE){
      if(GetHedgeProfit(shedge)>=HedgeTakeProfit){
         CloseAllHedgeTrades(shedge);
         SELLHEDGE=false;
         ArrayResize(shedge.baskettrades,0);
         ArrayResize(shedge.initialtrades,0);
         shedge.hedging=false;
         Print("exit sell hedge trade");
      }
      
      //adding new layers
      int size=ArraySize(shedge.baskettrades);
      if(size<MaximumOrders&&size>0){
         bool check = OrderSelect(shedge.baskettrades[size-1],SELECT_BY_TICKET);
         if(check){
            double entryprice=OrderOpenPrice();
            int direction=OrderType();
            double maxlots=OrderLots();
            
            if(OrderType()==OP_BUY){
               if((entryprice-Bid)/MyPoint>=RecoveryZone){
                  int tic=shortentry(maxlots*HedgeMultiplier);
                  
                  ArrayResize(shedge.baskettrades,size+1);
                  shedge.baskettrades[size]=tic;
                  Print("added sell hedge");
               }
            }
            if(OrderType()==OP_SELL){
               if((Ask-entryprice)/MyPoint>=RecoveryZone){
                  int tic=longentry(maxlots*HedgeMultiplier);
                  
                  ArrayResize(shedge.baskettrades,size+1);
                  shedge.baskettrades[size]=tic;
                  Print("added sell hedge");
               }
            }
         }
      }
   }     
}
*/