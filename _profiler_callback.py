from transformers import (TrainerCallback, TrainerControl, TrainerState,
                          TrainingArguments)


class ProfCallback(TrainerCallback):
    def __init__(self, prof):
        self.prof = prof

    def on_step_end(
        self,
        args: TrainingArguments,
        state: TrainerState,
        control: TrainerControl,
        **kwargs
    ):
        self.prof.step()
