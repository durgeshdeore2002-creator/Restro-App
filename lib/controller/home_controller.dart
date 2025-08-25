class HomePageController{

  checkDataMinus(int index){
     if(productPrice[index]>0){
      productPrice[index]--;
      totalCalculationMinus(prices[index]);
     }
  }
  checkDataPlus(int index){
      productPrice[index]++;
      totalCalculationAdd();
  }

  totalCalculationAdd(){
    total = 0;
    for(int i=0;i<productPrice.length;i++){
      if(productPrice[i]>0){
        total = total + (prices[i]*productPrice[i]);
      }
      
    }
  }
  totalCalculationMinus(int minusValue){
      total = total - minusValue;
  }

  int total = 0;
  List<String> verity = ["All","Snaks","Main Course","Beverage","Appetizers"];
  List<String> product = ["Chai","Poha","Sandwich","Bhel",];
  List<int> productPrice = [0,0,0,0,];
  List<String> paymentOptins = ["Cash","UPI","PhonePe","GooglePay","Paytm","Card"];
  List<int> prices = [20,25,12,40,];

}