from behave import given, when, then


@given(r'.*')
def step_generic_given(context, *args):
    context.last_given = context.text
    return None


@when(r'.*')
def step_generic_when(context, *args):
    context.last_when = context.text
    return None


@then(r'.*')
def step_generic_then(context, *args):
    context.last_then = context.text
    return None
