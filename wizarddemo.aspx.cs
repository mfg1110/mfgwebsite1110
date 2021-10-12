using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wizarddemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Wizard1_PreRender(object sender, EventArgs e)
    {
        Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
        SideBarList.DataSource = Wizard1.WizardSteps;
        SideBarList.DataBind();

        //if (Wizard1.ActiveStepIndex == 0)
        //{
        //    indexid = Registrationobj.getstepindex(id);
        //    if (indexid == 0)
        //    {
        //        Wizard1.ActiveStepIndex = 0;
        //    }
        //    else
        //    {
        //        Wizard1.ActiveStepIndex = indexid;
        //    }
        //}
        //else if(Wizard1.ActiveStepIndex == 1)
        //{
        //    indexid = Registrationobj.getstepindex(id);
        //    if (indexid == 1)
        //    {
        //        Wizard1.ActiveStepIndex = 1;
        //    }
        //    else
        //    {
        //        Wizard1.ActiveStepIndex = indexid;
        //    }
        //}
        //else if (Wizard1.ActiveStepIndex == 2)
        //{
        //    indexid = Registrationobj.getstepindex(id);
        //    if (indexid == 2)
        //    {
        //        Wizard1.ActiveStepIndex = 2;
        //    }
        //    else
        //    {
        //        Wizard1.ActiveStepIndex = indexid;
        //    }
        //}

        //if (indexid == 0)
        //{
        //    Wizard1.ActiveStepIndex = 0;
        //}
        //int stepIndex = indexid;

        //if (stepIndex < Wizard1.ActiveStepIndex)
        //{
        //   Wizard1.ActiveStepIndex= Wizard1.ActiveStepIndex + 1;
        //}
        //else if (stepIndex > Wizard1.ActiveStepIndex)
        //{
        //    Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex - 1;
        //}
        //else
        //{
        //    Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex;
        //}

    }
    protected string GetClassForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        if (step == null)
        {
            return "";
        }
        int stepIndex = Wizard1.WizardSteps.IndexOf(step);

        if (stepIndex < Wizard1.ActiveStepIndex)
        {
            return "prevStep";
        }
        else if (stepIndex > Wizard1.ActiveStepIndex)
        {
            return "nextStep";
        }
        else
        {
            return "currentStep";
        }
    }
    protected int GetIndexForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        int stepIndex = Wizard1.WizardSteps.IndexOf(step);

        return (stepIndex);
    }
    protected void StartNextButton_Click(object sender, EventArgs e)
    {

    }
    protected void StepNextButton_Click(object sender, EventArgs e)
    {

    }
    protected void FinishButton_Click(object sender, EventArgs e)
    {

    }
    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {

    }
    protected void Wizard1_Load(object sender, EventArgs e)
    {

    }
    protected void SideBarList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
}