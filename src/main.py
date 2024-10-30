import streamlit as st
from datetime import date

import pandas as pd
import yfinance as yf
from prophet import Prophet
from prophet.plot import plot_plotly
from plotly import graph_objs as go

from CONSTANTS import *

st.title(WEB_TITLE)

stocks = STOCKS
selected_stocks = st.selectbox(SELECT_BOX_MSG, stocks)

n_years = st.slider(SLIDER_MSG, 1, 4)
period = n_years * 365

@st.cache_data
def load_data(ticker):
    data = yf.download(ticker, START, TODAY)
    data.reset_index(inplace= True)
    return data

data_load_state = st.text(LOADING)
data = load_data(selected_stocks)
data_load_state.text(f'{LOADING}done!')

st.subheader(RAW_DATA)
st.write(data.tail())

if 'Date' not in data or 'Close' not in data:
    st.error("The data does not contain the required 'Date' and 'Close' columns.")
    st.stop()

def plot_raw_data():
    fig = go.Figure()
    fig.add_trace(go.Scatter(x=data['Date'], y=data['Open'], name='stock_open'))
    fig.add_trace(go.Scatter(x=data['Date'], y=data['Close'], name='stock_close'))
    fig.layout.update(title_text= 'Time Series Data', xaxis_rangeslider_visible=True)
    st.plotly_chart(fig)

plot_raw_data()

df_train = data[['Date', 'Close']]
df_train = df_train.rename(columns={'Date': 'ds', 'Close': 'y'})

if 'y' in df_train and isinstance(df_train['y'], pd.Series):
    df_train['y'] = pd.to_numeric(df_train['y'], errors='coerce')
else:
    st.error("The 'y' column is missing or has an incorrect format.")
    st.stop()

df_train = df_train.dropna(subset=['y'])

m = Prophet()
m.fit(df_train)
future = m.make_future_dataframe(periods=period)
forecast = m.predict(future)

st.subheader('Forecast data')
st.write(forecast.tail())

st.write('forecast data')
fig1 = plot_plotly(m, forecast)
st.plotly_chart(fig1)

st.write('forecast components')
fig2 = m.plot_components(forecast)
st.plotly_chart(fig2)