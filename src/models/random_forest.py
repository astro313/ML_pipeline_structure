import cPickle as pickle
import sys
sys.path.append('src')
from data import get_featues, get_label
from sklearn.ensemble import RandomForestClassifier

class RandomForestModel(object):
    def __init__(self, n_estimator=50, max_depth=700):
        self.clf = RandomForestClassifier(n_estimator=n_estimator,
                                          max_depth=max_depth)
        self.name = 'RandomForest'

    def get_params(self):
        return self.clf.get_params()

    def train(self, dframe):
        # from preprocess.py
        X = get_featues(dframe)
        Y = get_label(dframe)
        self.clf.fit(X, y)

    def predict(self, X):
        y_pred = self.clf.predict(X)

        return y_pred

    def save(self, fname):
        with open(fname, 'wb') as ofile:
            pickle.dump(self.clf, ofile, pickle.HIGHEST_PROTOCOL)

    def load(self, fname):
        with open(fname, 'rb') as ifile:
            self.clf = pickle.load(ifile)


