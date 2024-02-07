abstract class MeasuresState{
  const MeasuresState();
}

class InitialMeasuresState extends MeasuresState{
  const InitialMeasuresState();
}

class MeasuresLoading extends MeasuresState{
  const MeasuresLoading();
}

class MeasuresSaveDone extends MeasuresState{
  const MeasuresSaveDone();
}
