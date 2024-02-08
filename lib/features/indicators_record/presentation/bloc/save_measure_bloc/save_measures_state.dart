abstract class SaveMeasuresState{
  const SaveMeasuresState();
}

class SaveInitialMeasuresState extends SaveMeasuresState{
  const SaveInitialMeasuresState();
}

class SaveMeasuresLoading extends SaveMeasuresState{
  const SaveMeasuresLoading();
}

class SaveMeasuresDone extends SaveMeasuresState{
  const SaveMeasuresDone();
}
