
Access-Control-Allow-Origin: https://localhost:3000/don
Access-Control-Allow-Methods: POST,GET,PUT,DELETE
Access-Control-Allow-Headers: Authorization, Langconst cors = require('cors')
const express = require('express')
const morgan = require('morgan')
const app = express()
 require("dotenv").config()
const bodyParser =require("body-parser")
const stripe = require("stripe")(process.env.STRIPE_SECRET_TEST)
const Port = require(process.env.SERVER_URL)
const routes = require('./routes/index')
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
const corsOptions ={
  origin:'https://localhost:3000/don', 
  credentials:true,            //access-control-allow-credentials:true
  optionSuccessStatus:200,
}
app.use(cors(corsOptions))
app.use(morgan('dev'))

app.use(express.json())
app.use(express.urlencoded({ extended: true }))


app.post("/payment", cors(*), async(req, res)=>{
  let {amount, id }= req.body
  try{
    const payment = await stripe.paymentIntents.create({
      amount,
      currency:"USD",
      description: "don",
      payment_method:id,
      confirm: true
    })
    console.log("Payment", payment)
    res.json({
      paymentmessage:"Payment successful", 
      success:true
})
  }catch (error) {
console.log("error", error)
res.json({
  message: "payment failed",
  success: false
})
  }
})

//app.use('/account', routes.account)
app.listen(Port || 3000, () => console.log('Express server is running'))
