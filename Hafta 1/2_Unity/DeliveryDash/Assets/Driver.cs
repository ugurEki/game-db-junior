using UnityEngine;
using UnityEngine.InputSystem;

public class Driver : MonoBehaviour
{
    [SerializeField] float steerSpeed = 200f;
    [SerializeField] float moveSpeed = 10f;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        Debug.Log(Time.deltaTime);
    }

    // Update is called once per frame
    void Update()
    {
        float steer = 0f;
        float move = 0f;

        if (Keyboard.current.upArrowKey.isPressed)
        {
            // Debug.Log("We are pushing forward 1 unit.");
            move = 1f;
        }

        else if (Keyboard.current.downArrowKey.isPressed)
        {
            // Debug.Log("We are pushing bacward 1 unit.");
            move = -1f;
        }

        if (Keyboard.current.leftArrowKey.isPressed)
        {
            // Debug.Log("We are pushing left 1 unit.");
            steer = 1f;
        }

        else if (Keyboard.current.rightArrowKey.isPressed)
        {
           // Debug.Log("We are pushing right 1 unit.");
            steer = -1f;
        }

        float steerAmount = steer * steerSpeed * Time.deltaTime;
        float moveAmount = move * moveSpeed * Time.deltaTime;


        transform.Rotate(0, 0, steerAmount);
        transform.Translate(0, moveAmount, 0);

    }
}
