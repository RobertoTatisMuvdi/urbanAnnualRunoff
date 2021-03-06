% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imgClass.R
\name{buildClassMod}
\alias{buildClassMod}
\title{build image classification model (random forest)}
\usage{
buildClassMod(
  rawdir,
  image,
  groundTruth,
  groundTruthValues = list(roof = 1, street = 2, pervious = 3, shadow = 4, water = 5),
  overlayExists = FALSE,
  spectrSigName,
  modelName,
  nCores = parallel::detectCores() - 1,
  mtryGrd,
  ntreeGrd,
  nfolds = 3,
  nodesize = 3,
  cvrepeats = 2
)
}
\arguments{
\item{rawdir}{path to directory containing the image to be classified and the
ground truth data.}

\item{image}{The image to be classified. Supported formats are given in the
raster package's brick function.}

\item{groundTruth}{shapefile containing polygons indicating the observed
classes of a sample of pixels. These classes must be contained in a column
named 'cover' in the shape-file's attribute table. The table may contain
further columns.}

\item{groundTruthValues}{list with key value pairs (default: list('roof' = 1,
'street' = 2, 'pervious' = 3, 'shadow' = 4, 'water' = 5))}

\item{overlayExists}{if FALSE, the function overlays the ground truth data
and the image (time consuming) and saves an R object containing the former's
spectral signatures with name spectrSigName (overlay object). If TRUE, the
function will skip this overlay operation and read an existing overlay object
with name 'spectrSigName'.(default: FALSE)}

\item{spectrSigName}{File name of overlay object, either for saving a new or
load an existing file.}

\item{modelName}{File name for saving the fitted random forest model}

\item{nCores}{no. of cores for running in parallel mode (uses library
'doParallel'), (default: parallel::detectCores() - 1)}

\item{mtryGrd}{Number of trees to grow. In the random forests literature, this
is referred to as the ntree parameter. Larger number of trees produce more
stable models and covariate importance estimates, but require more memory and
a longer run time. For small datasets, 50 trees may be sufficient. For larger
datasets, 500 or more may be required. Please consult the random forests
literature for extensive discussion of this parameter (e.g. Cutler et al., 2007;
Strobl et al., 2007; Strobl et al., 2008).}

\item{ntreeGrd}{Number of variables available for splitting at each tree node.
In the random forests literature, this is referred to as the mtry parameter.
There is extensive discussion in the literature about the influence of mtry.
Cutler et al. (2007) reported that different values of mtry did not affect
the correct classification rates of their model and that other performance
metrics (sensitivity, specificity, kappa, and ROC AUC) were stable under
different values of mtry. On the other hand, Strobl et al. (2008) reported
that mtry had a strong influence on predictor variable importance estimates.}

\item{nfolds}{number of folds in repeated cross validation (caret),
(default: 3)}

\item{nodesize}{a single value (not included in grid search), (default: 3)}

\item{cvrepeats}{number of repeats in repeated cross validation (caret),
(default: 2)}
}
\value{
writes a lot of output files to different folders ??? (details!)
}
\description{
Wrapper function for fitting a random forest using a multi-band
image with the purpose of classifying pixels into roof, street, and pervious
(green areas, water surface), etc. These categories are defined by the user
in the ground truth data. Training and testing are done using repeated
cross-validation with package caret
}
