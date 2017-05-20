import { combineReducers } from 'redux';

const FETCH_HEADLINES_REQUEST = 'FETCH_HEADLINES_REQUEST';
const FETCH_HEADLINES_REQUEST_FAILURE = 'FETCH_HEADLINES_REQUEST_FAILURE';
const FETCH_HEADLINES_REQUEST_SUCCESS = 'FETCH_HEADLINES_REQUEST_SUCCESS';


export const fetchHeadlinesRequest = () => ({
  type: FETCH_HEADLINES_REQUEST,
})

export const fetchHeadlinesRequestFailure = () => ({
  type: FETCH_HEADLINES_REQUEST_FAILURE,
})

export const fetchHeadlinesRequestSuccess = payload => ({
  type: FETCH_HEADLINES_REQUEST_SUCCESS,
  payload,
})

export const headlinesActions = {
  fetchHeadlinesRequest,
  fetchHeadlinesRequestFailure,
  fetchHeadlinesRequestSuccess,
}

const initialState = {
  isFetching: false,
  byId: {},
  indexIds: [],
};

const isFetching = (state = initialState.isFetching, { type }) => {
  switch (type) {
    case FETCH_HEADLINES_REQUEST:
      return true
    case FETCH_HEADLINES_REQUEST_FAILURE:
    case FETCH_HEADLINES_REQUEST_SUCCESS:
      return false
    default:
      return state;
  }
};

const byId = (state = initialState.byId, { payload, type }) => {
  switch (type) {
    case FETCH_HEADLINES_REQUEST_SUCCESS:
      return { ...state, ...payload.entities.headlines }
    default:
      return state;
  }
};

const indexIds = (state = initialState.indexIds, { payload, type }) => {
  switch (type) {
    case FETCH_HEADLINES_REQUEST_SUCCESS:
      return payload.result
    default:
      return state;
  }
};

export default combineReducers({
  isFetching,
  byId,
  indexIds,
})
